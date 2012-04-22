<?php
include 'tesseract.php';
$api= new TessBaseAPI;
$api->Init(".","eng",$mode_or_oem=OEM_DEFAULT);
$api->SetPageSegMode(PSM_AUTO);

$mImgFile = "eurotext.jpg";
$handle=fopen($mImgFile,"rb");
$mBuffer=fread($handle,filesize($mImgFile));
print strlen($mBuffer);
$result=ProcessPagesBuffer($mBuffer,strlen($mBuffer)*4,$api);
print "result(ProcessPagesBuffer)=";
print $result;
$result = ProcessPagesFileStream($mImgFile,$api);
print "result(ProcessPagesFileStream)=";
print $result;

?>
