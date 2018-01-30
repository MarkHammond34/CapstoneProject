<div class="modal fade" id="aboutMe" tabindex="-1" role="dialog"
	aria-labelledby="messageLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="messageLabel">Change your About Me:</h3>
			</div>
			<div class="modal-body">

				<form action="AboutMeServlet" method="post">
					<!--  
					<div class="form-group">
					
						<label for="image-upload" class="form-control-label">Upload
							Image</label>
						<div class="input-group">
							<span class="input-group-btn"> <span
								class="btn btn-default btn-file"> Browse...<input
									type="file" id="imgInp">
							</span>
							</span> <input type="text" class="form-control" readonly>
						</div>
						<img id='img-upload' />
					</div>
					-->
					<div class="form-group">
						<label for="message-text" class="form-control-label">Home
							City:</label> <input type="text" class="form-control" name="homeCity">
					</div>
					<div class="form-group">
						<label for="message-text" class="form-control-label">Home
							State:</label> <input type="text" class="form-control" name="homeState">
					</div>
					<div class="form-group">
						<label for="message-text" class="form-control-label">Year
							in Program:</label> <input type="text" class="form-control"
							name="yearInProgram">
					</div>
					<div class="form-group">
						<label for="message-text" class="form-control-label">Hobby:</label>
						<input type="text" class="form-control" name="hobby">
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