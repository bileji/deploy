<?php
#echo phpinfo();exit;

echo "Step1. redis connection<br/>\r\n";
$redis = new Redis();
$redis->connect('49.213.11.59', 6379);
echo "Connection to server sucessfully<br/>\r\n";
$redis->set("tutorial-name", "Redis tutorial");
echo "Stored string in redis:: " . $redis->get("tutorial-name") . "<br/>\r\n";
echo "End !!!<br/>\r\n";

echo "Step2. mysql connection<br/>\r\n";
#$con = mysql_connect("49.213.11.59", "xzt_db", "!dF3BBaf43");
#if (!$con){
#    echo "Could not connect: " . mysql_error();
#} else {
#    echo "Connection to server successfully<br/>\r\n";
#}
echo "End !!!<br/>\r\n";

echo "Step3. mongodb connection<br/>\r\n";
$connection = new Mongo("mongodb://xzt_db:841c6e89@49.213.11.59:27017/admin");
print_r($connection->listDBs());
echo "End !!!<br/>\r\n";
