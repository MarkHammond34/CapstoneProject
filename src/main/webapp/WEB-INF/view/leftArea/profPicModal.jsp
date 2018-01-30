<div class="modal fade" id="changeAvi" tabindex="-1" role="dialog"
	aria-labelledby="messageLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="messageLabel">Choose your avatar:</h3>
			</div>
			<div class="modal-body">

				<form action="AvatarServlet" method="get">
					<div id="avatars">
						<label class="avatars"> <input type="radio" name="avatar" value="1"/>
							<img src="assets/img/avatars/avatar1.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="2"/>
							<img src="assets/img/avatars/avatar2.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="3"/>
							<img src="assets/img/avatars/avatar3.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="4"/>
							<img src="assets/img/avatars/avatar4.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="5"/>
							<img src="assets/img/avatars/avatar5.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="6"/>
							<img src="assets/img/avatars/avatar6.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="7"/>
							<img src="assets/img/avatars/avatar7.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="8"/>
							<img src="assets/img/avatars/avatar8.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="9"/>
							<img src="assets/img/avatars/avatar9.png" alt="" />
						</label> <label class="avatars"> <input type="radio" name="avatar" value="10"/>
							<img src="assets/img/avatars/avatar10.png" alt="" />
						</label>
					</div>
					<input name="post" type="submit" class="btn btn-primary">
				</form>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Post</button> -->
			</div>
		</div>
	</div>
</div>