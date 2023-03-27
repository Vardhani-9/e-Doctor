<?php
include("dbconnection.php");

//if ($_POST) {
    $_POST = json_decode(file_get_contents('php://input'), true);
    
    //echo "<pre>";print_r($_POST);echo "</pre>";
    $order = $_POST['sortOrder'];
 
    $departmentId = $_POST['departmentId'];
 
    $locationId = $_POST['locationId'];
 
    $sortOrder = '';
    switch ($order) {
        case 'fee_asc':
            $sortOrder = "d.consultancy_charge asc";
            break;
        case 'fee_desc':
            $sortOrder = "d.consultancy_charge desc";
            break;
        case 'rating_asc':
            $sortOrder = "d.doctor_rating asc";
            break;
        case 'rating_desc':
            $sortOrder = "d.doctor_rating desc";
            break;
        default:
            $sortOrder = "d.consultancy_charge asc";
            break;
    }
    $sql = "select * from doctor d
    inner join doctor_location dl on d.doctorid = dl.doctor_id
    inner join locations l on dl.location_id = l.location_id
    inner join department dp on d.departmentid = dp.departmentid
    where d.status='Active' and  dp.departmentid =  ".$departmentId." and l.location_id = ".$locationId." order by  " . $sortOrder . ";";
    //echo $sql;
    $doctorsHtml =  "";
    $doctorsList = [];
    if ($qsqldoctor = mysqli_query($con, $sql)) {
        $i = 0;
        while ($rsdoctor = mysqli_fetch_assoc($qsqldoctor)) {
            $doctorsList[] = $rsdoctor;
           /*  $doctorsList[$i]['doctorId'] = $rsdoctor['doctor_id'];
            $doctorsList[$i]['doctorName'] = $rsdoctor['doctorname'];
            $doctorsList[$i]['doctorRating'] = $rsdoctor['doctor_rating']; */
            $doctorsHtml .=  "<option value='$rsdoctor[doctorid]' >$rsdoctor[doctorname] (";
            $sqldept = "SELECT * FROM department WHERE departmentid='$rsdoctor[departmentid]'";
            $qsqldept = mysqli_query($con, $sqldept);
            $rsdept = mysqli_fetch_array($qsqldept);
            $doctorsHtml .=  $rsdept['departmentname'];
            //$doctorsList[$i]['departmentName'] = $rsdept['departmentname'];
            $doctorsHtml .=  ")</option>";

           /*  echo   "<option value='$rsdoctor[doctorid]' >$rsdoctor[doctorname] (";
            $sqldept = "SELECT * FROM department WHERE departmentid='$rsdoctor[departmentid]'";
            $qsqldept = mysqli_query($con, $sqldept);
            $rsdept = mysqli_fetch_array($qsqldept);
            echo   $rsdept['departmentname'];
            echo  ")</option>"; */
            $i ++;
        }
        
         echo  json_encode($doctorsList);
         header("Content-type:application/json");

        //echo $doctorsHtml;
    } else {
        echo mysqli_error($con);
    }
//}
