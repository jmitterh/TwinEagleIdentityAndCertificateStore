class MemberGroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_member_group, only: [:show, :edit, :update, :destroy]

  # GET /member_groups
  # GET /member_groups.json
  def index
    @member_groups = MemberGroup.all
  end

  # GET /member_groups/1
  # GET /member_groups/1.json
  def show
  end

  # GET /member_groups/new
  def new
    @member_group = MemberGroup.new
  end

  # GET /member_groups/1/edit
  def edit
  end

  # POST /member_groups
  # POST /member_groups.json
  def create
    @member_group = MemberGroup.new(member_group_params)

    respond_to do |format|
      if @member_group.save
        format.html { redirect_to @member_group, notice: 'Member group was successfully created.' }
        format.json { render :show, status: :created, location: @member_group }
      else
        format.html { render :new }
        format.json { render json: @member_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_groups/1
  # PATCH/PUT /member_groups/1.json
  def update
    respond_to do |format|
      if @member_group.update(member_group_params)
        format.html { redirect_to @member_group, notice: 'Member group was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_group }
      else
        format.html { render :edit }
        format.json { render json: @member_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_groups/1
  # DELETE /member_groups/1.json
  def destroy
    @member_group.destroy
    respond_to do |format|
      format.html { redirect_to member_groups_url, notice: 'Member group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_group
      @member_group = MemberGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_group_params
      params.require(:member_group).permit(:NetworkUser_id, :UserGroup_id, :CreatedBy, :CreatedDate, :LastModifiedBy, :LastModifiedDate, :IsDeleted)
    end
end
