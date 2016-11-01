<?php 
//store variables

session_start();
if(isset($_POST['title'])){
	$_SESSION['title']=$_POST['title'];
	$_SESSION['reportcntent']=$_POST['reportcntent'];
}

require('fpdf181/html_table.php');


$pdf=new PDF();
$pdf->AddPage('P', 'letter');

$pdf->SetFont('Arial','',12);

//title
$title=$_SESSION['title'];
$pdf->WriteHTML('<strong>'.$title.'</strong></br></br>');
$pdf->Ln();
$pdf->Ln();

//content

$html=$_SESSION['reportcntent'];

$pdf->WriteHTML($html);


//Output the document
$time=time();
$pdf->Output('F','reports/tableaudebord/report_'.$time.'.pdf');
echo $time; 
 exit;
?>
