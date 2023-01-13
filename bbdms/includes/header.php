<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_POST['submit']))
  {
    $fullname=$_POST['fullname'];
$mobile=$_POST['mobileno'];
$email=$_POST['emailid'];
$age=$_POST['age'];
$donation=$_POST['donation'];
$donationgroup=$_POST['donationgroup'];
$address=$_POST['address'];
$message=$_POST['message'];
$files=$_FILES["upfile"];
$filename=$_FILES["upfile"]["name"];
$filerror=$_FILES["upfile"]["error"];
$filetemp=$_FILES["upfile"]["tmp_name"]; 

$fileext= explode('.', $filename);
$filecheck=strtolower(end($fileext));
$fileextstored=array('png','jpg','jpeg');

if(in_array($filecheck,$fileextstored))
{
    $destfile="C:/xampp/htdocs/BBDMS-Project-PHP/bbdms/includes/uploads/".$filename;
    //C:\xampp\htdocs\BBDMS-Project-PHP\bbdms\includes\uploads
    move_uploaded_file($filetemp,$destfile);
}
else{
    $destfile="C:/xampp/htdocs/BBDMS-Project-PHP/bbdms/includes/uploads/donor.jpg";
    move_uploaded_file($filetemp,$destfile);
    $filename="donor.jpg";
}
$status=1;
    $password=md5($_POST['password']);
    $ret="select EmailId from tbldonars where EmailId=:email";
    $query= $dbh -> prepare($ret);
    $query-> bindParam(':email', $email, PDO::PARAM_STR);
    $query-> execute();
    $results = $query -> fetchAll(PDO::FETCH_OBJ);
if($query -> rowCount() == 0)
{
 //$sql="INSERT INTO  tbldonars(FullName,MobileNumber,EmailId,Age,Donation,DonationGroup,Address,Message,status,Password,pathless) VALUES(:fullname,:mobile,:email,:age,:donation,:donationgroup,:address,:message,:status,:password,:filename)";
$sql="CALL in_donor(:fullname,:mobile,:email,:age,:donation,:donationgroup,:address,:message,:status,:password,:filename)";
$query = $dbh->prepare($sql);
$query->bindParam(':fullname',$fullname,PDO::PARAM_STR);
$query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':age',$age,PDO::PARAM_STR);
$query->bindParam(':donation',$donation,PDO::PARAM_STR);
$query->bindParam(':donationgroup',$donationgroup,PDO::PARAM_STR);
$query->bindParam(':address',$address,PDO::PARAM_STR);
$query->bindParam(':message',$message,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->bindParam(':password',$password,PDO::PARAM_STR);
//$query->bindParam(':destfile',$destfile,PDO::PARAM_STR);
$query->bindParam(':filename',$filename,PDO::PARAM_STR);
if($query->execute())
//$lastInsertId = $dbh->lastInsertId();
//if($lastInsertId)
{

echo "<script>alert('You have signed up successfully');</script>";
//print_r($_FILES["upfile"]);
}
else
{

echo "<script>alert('Something went wrong.Please try again');</script>";
}
}
 else
{

echo "<script>alert('Email-id already exist. Please try again');</script>";
}
}
if(isset($_POST['login'])) 
  {
    $email=$_POST['email'];
    $password=md5($_POST['password']);
    $sql ="SELECT id FROM tbldonars WHERE EmailId=:email and Password=:password";
    $query=$dbh->prepare($sql);
    $query->bindParam(':email',$email,PDO::PARAM_STR);
$query-> bindParam(':password', $password, PDO::PARAM_STR);
    $query-> execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    if($query->rowCount() > 0)
{
foreach ($results as $result) {
$_SESSION['bbdmsdid']=$result->id;
}
$_SESSION['login']=$_POST['email'];
echo "<script type='text/javascript'> document.location ='index.php'; </script>";
} else{
echo "<script>alert('Invalid Details');</script>";
}
}

?>
<!-- header -->
    <header>
        <!-- top-bar -->
        <div class="top-bar py-3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 top-social-agile">
                        <div class="row">
                            <!-- social icons -->
                            <ul class="col-lg-4 col-6 top-right-info text-center">
                                <li>
                                    <a href="https://www.facebook.com/">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li class="mx-3">
                                    <a href="https://twitter.com/?lang=en-in">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                </li>
                                
                            </ul><?php 
$pagetype="contactus";
$sql = "SELECT * from tblcontactusinfo";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{ ?>
                            <!-- //social icons -->
                            <div class="col-6 header-top_w3layouts pl-3 text-lg-left text-center">
                                <p class="text-white">
                                    <i class="fas fa-map-marker-alt mr-2"></i><?php  echo $result->Address; ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 top-social-agile text-lg-right text-center">
                        <div class="row">
                            <div class="col-lg-7 col-6 top-w3layouts">
                                <p class="text-white">
                                    <i class="far fa-envelope-open mr-2"></i>
                                    <a href="mailto:info@example.com" class="text-white"><?php  echo $result->EmailId; ?></a>
                                </p>
                            </div>
                            <div class="col-lg-5 col-6 header-w3layouts pl-4 text-lg-left">
                                <p class="text-white">
                                    <i class="fas fa-phone mr-2"></i>+<?php  echo $result->ContactNo; ?></p>
                            </div>
                        </div><?php } } ?>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- //top-bar -->

    <!-- header 2 -->
    <div id="home">
        <!-- navigation -->
        <div class="main-top py-1">
            <nav class="navbar navbar-expand-lg navbar-light fixed-navi">
                <div class="container">
                    <!-- logo -->
                    <h1>
                        <a class="navbar-brand font-weight-bold font-italic" href="index.php">
                            <span>Donation Management</span> 
                            
                        </a>
                    </h1>
                    <!-- //logo -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-lg-auto">
                            <li class="nav-item active mt-lg-0 mt-3">
                                <a class="nav-link" href="index.php">Home
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item mx-lg-4 my-lg-0 my-3">
                                <a class="nav-link" href="about.php">About Us</a>
                            </li>
                            <li class="nav-item mx-lg-4 my-lg-0 my-3">
                                <a class="nav-link" href="contact.php">Volunteer With Us</a>
                            </li>
                            <li class="nav-item mx-lg-4 my-lg-0 my-3">
                                <a class="nav-link" href="donor-list.php">Donor List</a>
                            </li>
                            <li class="nav-item mx-lg-4 my-lg-0 my-3">
                                <a class="nav-link" href="search.php">Search Donor</a>
                            </li>
                            <?php if (strlen($_SESSION['bbdmsdid']!=0)) {?>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    My Account
                                </a>
                                
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                                    <a class="dropdown-item" href="profile.php">Profile</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="change-password.php">Change Password</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="request-received.php">Request Received By Seeker</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="request-delete.php">Request Delete / Hide Account</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout.php">Logout</a>
                                </div>
                            </li>
                            <?php } ?>
                            <?php if (strlen($_SESSION['bbdmsdid']==0)) {?>
                            <li class="nav-item mx-lg-4 my-lg-0 my-3">
                                <a class="nav-link" href="admin/index.php">Admin</a>
                            </li>
                        </ul>
                        <!-- login -->
                        <a href="#" class="login-button ml-lg-5 mt-lg-0 mt-4 mb-lg-0 mb-3" data-toggle="modal" data-target="#exampleModalCenter1">
                            <i class="fas fa-sign-in-alt mr-2"></i>Login</a><?php } ?>
                        <!-- //login -->
                    </div>
                </div>
            </nav>
        </div>
        <!-- //navigation -->
        <!-- modal -->
        <!-- login -->
        <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="login px-4 mx-auto mw-100">
                            <h5 class="text-center mb-4">Login Now</h5>
                            <form action="#" method="post" name="login">
                                <div class="form-group">
                                    <label>Email ID</label>
                                    <input type="email" class="form-control" name="email" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label class="mb-2">Password</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="" required="">
                                </div>
                                <button type="submit" class="btn submit mb-4" name="login">Login</button>
                                <p class="forgot-w3ls text-center pb-4">
                                    <!-- <a href="#" class="text-white">Forgot your password?</a> -->
                                </p>
                                <p class="account-w3ls text-center pb-4">
                                    Don't have an account?
                                    <a href="#" data-toggle="modal" data-target="#exampleModalCenter2">Create one now</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //login -->
        <!-- register -->
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content modal-content-2">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="login px-4 mx-auto mw-100">
                            <h5 class="text-center mb-4">Register Now</h5>
                            <form action="#" method="POST"  name="signup" onsubmit="return checkpass();" enctype="multipart/form-data">
                               
                            <div class="form-group">
                                    <label>Full Name</label>
                                     <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Full Name" required="">
                                </div>
                                <div class="form-group">
                                    <label>Profile Picture</label>
                                     <input type="file" class="form-control" name="upfile" id="file" placeholder="Uplaod Donation Picture" required="">
                                </div>
                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <input type="text" class="form-control" name="mobileno" id="mobileno" required="true" placeholder="Mobile Number" maxlength="10" pattern="[0-9]+">
                                </div>
                                
                                <div class="form-group">
                                    <label class="mb-2">Email Id</label>
                                    <input type="email" name="emailid" class="form-control" placeholder="Email Id">
                                </div>
                                <div class="form-group">
                                    <label class="mb-2">Age</label>
                                    <input type="text" class="form-control" name="age" id="age" placeholder="Age" required="">
                                </div>
                                <div class="form-group">
                                    <label class="mb-2">Donation</label>
                                    <input type="text" class="form-control" name="donation" placeholder="What to donate" required="">
                                    
                                </div>
                                
                                <div class="form-group">
                                    <label class="mb-2">Donation Group</label>
                                    <select name="donationgroup" class="form-control" required>
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
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="address" id="address" required="true" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <label>Description for Request</label>
                                    <textarea class="form-control" name="message" required> </textarea>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password" id="password" required="">
                                </div>
                               
                                <button type="submit" class="btn btn-primary submit mb-4" name="submit">Register</button>
                              
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //register -->
        <!-- //modal -->
    </div>
    <!-- //header 2 -->