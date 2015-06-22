Php-tesseract is a wrapper class for Tesseract OCR that allows any conventional image files (JPG, GIF ,PNG , TIFF and etc) to be read and decoded into readable languages. No temporary file will be created during the OCR processing.

```

<?php
include 'tesseract.php';
$api= new TessBaseAPI;
$api->Init(".","eng",$mode_or_oem=OEM_DEFAULT);
$api->SetPageSegMode(PSM_AUTO);

$mImgFile = "eurotext.jpg";
$handle=fopen($mImgFile,"rb");
$mBuffer=fread($handle,filesize($mImgFile));
print strlen($mBuffer);
$result=ProcessPagesBuffer($mBuffer,strlen($mBuffer),$api);
print "result(ProcessPagesBuffer)=";
print $result;
$result = ProcessPagesFileStream($mImgFile,$api);
print "result(ProcessPagesFileStream)=";
print $result;

?>
```