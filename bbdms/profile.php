
<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['bbdmsdid']==0)) {
  header('location:logout.php');
  } else{

 if(isset($_POST['update']))
  {
    $uid=$_SESSION['bbdmsdid'];
    $name=$_POST['fullname'];
    $mno=$_POST['mobileno']; 
    $emailid=$_POST['emailid'];
    $age=$_POST['age']; 
    $donation=$_POST['donation'];
    $donationgroup=$_POST['donationgroup']; 
    $address=$_POST['address'];
    $message=$_POST['message']; 
  $sql="update tbldonars set FullName=:name,MobileNumber=:mno, Age=:age,Donation=:donation,DonationGroup=:donationgroup,Address=:address,Message=:message  where id=:uid";
     $query = $dbh->prepare($sql);
     $query->bindParam(':name',$name,PDO::PARAM_STR);
     $query->bindParam(':mno',$mno,PDO::PARAM_STR);
     $query->bindParam(':age',$age,PDO::PARAM_STR);
     $query->bindParam(':donation',$donation,PDO::PARAM_STR);
     $query->bindParam(':donationgroup',$donationgroup,PDO::PARAM_STR);
     $query->bindParam(':address',$address,PDO::PARAM_STR);
     $query->bindParam(':message',$message,PDO::PARAM_STR);
     $query->bindParam(':uid',$uid,PDO::PARAM_STR);
     $query->execute();
        echo '<script>alert("Profile has been updated")</script>';
  }

  ?>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Donation Management !! Donor Profile</title>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--// Meta tag Keywords -->

	<!-- Custom-Files -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Bootstrap-Core-CSS -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //Web-Fonts -->

</head>

<body>
	<?php include('includes/header.php');?>

	<!-- banner 2 -->
	<div class="inner-banner-w3ls">
		<div class="container">

		</div>
		<!-- //banner 2 -->
	</div>
	<!-- page details -->
	<div class="breadcrumb-agile">
		<div aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="index.php">Home</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">Donor Profile</li>
			</ol>
		</div>
	</div>
	<!-- //page details -->

	<!-- contact -->
	<div class="appointment py-5">
		<div class="py-xl-5 py-lg-3">
			<div class="w3ls-titles text-center mb-5">
				<h3 class="title">Donor Profile</h3>
				<span>
				</span>
			</div>
			<div class="d-flex">
				<div class="appoint-img">

				</div>
				<div class="contact-right-w3l appoint-form">
					<h5 class="title-w3 text-center mb-5">Detail of Your profile</h5>
					<form action="#" method="post">
						<?php
$uid=$_SESSION['bbdmsdid'];
$sql="SELECT * from  tbldonars where id=:uid";
$query = $dbh -> prepare($sql);
$query->bindParam(':uid',$uid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>
					<div class="col-md-4 pricing"><div class="price-top">
					<img src="<?php echo htmlentities("./includes/uploads/".$row->pathless);?>" alt=" Donor" width="430px" height="250px" style="border:1px #000 solid"  />
					</div></div>
					<br>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Full Name</label>
							<input type="text" class="form-control" name="fullname" id="fullname" value="<?php  echo $row->FullName;?>">
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Mobile Number</label>
							<input type="text" class="form-control" name="mobileno" id="mobileno" required="true" maxlength="10" pattern="[0-9]+" value="<?php  echo $row->MobileNumber;?>">
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Email Id <span style="color:red; font-size:10px;">(Can't be Change)</span></label>
							<input type="email" name="emailid" class="form-control" value="<?php  echo $row->EmailId;?>" readonly>
						</div>
						<div class="form-group">
							<label for="recipient-phone" class="col-form-label">Age</label>
							<input type="text" class="form-control" name="age" id="age" required="" value="<?php  echo $row->Age;?>">
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Donation</label>
							<input type="text" class="form-control" name="donation" id="donation" required="" value="<?php  echo $row->Donation;?>">
							</select>
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Donation Group</label>
							<select name="donationgroup" class="form-control" required>
								<option value="<?php  echo $row->DonationGroup;?>"><?php  echo $row->DonationGroup;?></option>
<?php $sql = "SELECT * from  tblgroup ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->DonationGroup);?>"><?php echo htmlentities($result->DonationGroup);?></option>
<?php }} ?>
</select>
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Address</label>
							<input type="text" class="form-control" name="address" id="address" required="true" value="<?php  echo $row->Address;?>">
						</div>
						<div class="form-group">
							<label for="datepicker" class="col-form-label">Message</label>
							<textarea class="form-control" name="message" required><?php  echo $row->Message;?></textarea>
						</div>
						
						<?php $cnt=$cnt+1;}} ?>
						<input type="submit" value="Update" name="update" class="btn_apt">
					</form>
				</div>
				<div class="clerafix"></div>
			</div>
		</div>
	</div>
	<!-- //contact -->

	<?php include('includes/footer.php');?>
	<!-- Js files -->
	<!-- JavaScript -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Default-JavaScript-File -->

	<!--start-date-piker-->
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1").datepicker();
		});
	</script>
	<!-- //End-date-piker -->

	<!-- fixed navigation -->
	<script src="js/fixed-nav.js"></script>
	<!-- //fixed navigation -->

	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- move-top -->
	<script src="js/move-top.js"></script>
	<!-- easing -->
	<script src="js/easing.js"></script>
	<!--  necessary snippets for few javascript files -->
	<script src="js/medic.js"></script>

	<script src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->

	<!-- //Js files -->

</body>

</html><?php } ?>