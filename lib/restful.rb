module Restful
  def self.included base
    base.before_action :find, only: [ :show, :edit, :update ]
  end

  def index
    self.collection = model.all
  end

  def show
  end

  def new
    self.instance = model.new
  end

  def create
    self.instance = model.new post_params
    if instance.save
      redirect_to instance
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if params.include? :delete
      instance.destroy
      redirect_to collection_path
    elsif instance.update_attributes post_params
      redirect_to instance
    else
      render 'edit'
    end
  end

  private

  def plural_name
    @plural_name ||= self.class.name.gsub(/Controller$/, '').downcase
  end

  def singular_name
    @singular_name ||= plural_name.singularize
  end

  def model
    @model ||= singular_name.capitalize.constantize
  end

  def find
    self.instance = model.find_by_param! params[:id]
  end

  def instance
    instance_variable_get "@#{ singular_name }"
  end

  def instance= value
    instance_variable_set "@#{ singular_name }", value
  end

  def collection
    instance_variable_get "@#{ plural_name }"
  end

  def collection= value
    instance_variable_set "@#{ plural_name }", value
  end

  def collection_path
    url_for controller: plural_name, action: 'index'
  end
end
