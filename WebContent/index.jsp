<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CRF-Data</title>

<!-- CSS -->
<link rel="stylesheet" href="css/authentification.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">

				 <div class="row">
				 <div class="col-sm-12 text-center">
						<img src="asset/images/unnamed.png" width="400px;">
					</div>
				</div> 
				<div class="container login-container">
					<div class="row">
						<div class="col-md-6 login-form-1">
							<h3 style="color: #34659a;">Se connecter</h3>
							<form action="Connexion.chu" method="post">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Votre Email *" name="login" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Votre Mot de passe *" name="password" />
								</div>
								<div class="form-group">
									<input type="submit" class="btnSubmit" value="Se connecter" />
								</div>
							</form>
						</div>
						<div class="col-md-6 login-form-2">
							<h3>S'inscrire</h3>
							<form>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Votre Nom *" value="" name="nom" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Votre prenom *" value="" name="prenom" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Votre Email *" value="" name="email" />
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="Votre Mot de passe *" value="" name="password" />
								</div>
								<div class="form-group">
									<input type="submit" class="btnSubmit" value="S'inscrire" />
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Javascript -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



	<!-- Javascript -->
	<!-- <script src="assetss/js/jquery-1.11.1.min.js"></script>
	<script src="assetss/bootstrap/js/bootstrap.min.js"></script>
	<script src="assetss/js/jquery.backstretch.min.js"></script>
	<script src="assetss/js/scripts.js"></script> -->

	<!--[if lt IE 10]>
            <script src="assetss/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>