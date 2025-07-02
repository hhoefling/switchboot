<?php
/*
#
#   File: index.php Mainfile von switchboot
#
#   Copyright 2023 Heinz Höfling
#
#     switchboot is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     switchboot is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with openWB.  If not, see <https://www.gnu.org/licenses/>.
# in /etc/sudoers ist die folgende Zeile nötig
#     www-data ALL=(ALL) NOPASSWD: /usr/bin/systemd-run

#
*/

 $html="/var/www/html";
 $dbg=[];
 $debug=0;
 $do="";
 $name="";

 
  function debout($l)
  {
    global $dbg,$debug;
    if( $debug>0 )
      $dbg[]= "DBG:" . $l;
  }
  function meld($l)
  {
    global $dbg;
    $dbg[]= $l;
  }



 if( isset($_GET['debug'])) $debug=$_GET['debug'];
 if( isset($_POST['do']) && $_POST['do']>'')
    $do=trim($_POST['do']);
   
 $pwd= dirname($_SERVER['SCRIPT_FILENAME']); //  /var/www/html/switchwb/switcher.php
 $logfile = $pwd . "/switchlog.log";

 $showlog=0;
 $logend=-1;

 debout( "logend:$logend do:$do");
 if( $do == "" || $do == "refresh")
 {
  if(file_exists($logfile) )
  {
       $logs=file($logfile); 
       $logend=0;
       foreach( $logs as $l)
       {
           if( preg_match('/::END::/', $l) ) 
                 $logend=1;
           else  meld( $l );
       }
       if($logend==0)
        {
          meld( ".....(bitte warten)");        
          $showlog=1;
        }  
  }
 }

 $d=date("d.m.Y H.i.s");
 if( $do == "umount" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
    {
     $name =  $_POST['name'];
	 $command = "sudo -n systemd-run --wait --pty --unit='mounter' $pwd/doumounts.sh $name $debug >>$logfile 2>&1 &";
     file_put_contents($logfile, $d." ** NOTE **\n");
     file_put_contents($logfile, $d." ** in sudoers: www-data ALL=(ALL) NOPASSWD: /usr/bin/systemd-run **\n", FILE_APPEND);
     file_put_contents($logfile, $d." ** unmount device... **\n",FILE_APPEND);
     file_put_contents($logfile, $d." $command \n",FILE_APPEND);
     shell_exec($command);
     header('Location: '."");
    } 
 }
 if( $do == "mount" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
    {
     $name =  $_POST['name'];
	 $command = "sudo -n systemd-run --wait --pty --unit='mounter' $pwd/domounts.sh $name $debug >>$logfile 2>&1 &";
     file_put_contents($logfile, $d." ** NOTE **\n");
     file_put_contents($logfile, $d." ** in sudoers: www-data ALL=(ALL) NOPASSWD: /usr/bin/systemd-run **\n",FILE_APPEND);
     file_put_contents($logfile, $d." ** Mount device... **\n",FILE_APPEND);
     file_put_contents($logfile, $d." $command \n",FILE_APPEND);
     shell_exec($command);
     # exec($cmd);
    } 
    header('Location: '."");
 }
 elseif( $do == "reboot" )
 {
   $command = "sudo -n /bin/bash -c \"$pwd/doreboot.sh $debug >>$logfile 2>&1 & \" ";
   file_put_contents($logfile, $d."\n** Neustart auslösen...\n");
   shell_exec($command);   
   header('Location: '."");
 }
 elseif( $do == "latchowb" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
   { 
     $name =  $_POST['name'];
     $command = "sudo -n /bin/bash -c \"$pwd/latchowb.sh $name $debug >>$logfile 2>&1 & \" ";
     file_put_contents($logfile, $d."\n** Kopiere openWB-Data...\n");
     shell_exec($command);   
    }
   header('Location: '."");
 }
 elseif( $do == "unboot" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
   { 
     $name =  $_POST['name'];
     $command = "sudo -n /bin/bash -c \"$pwd/unboot.sh $name $debug >>$logfile 2>&1 & \" ";
     file_put_contents($logfile, $d."\n** Deaktiviere $name\n");
     shell_exec($command);   
    }
   header('Location: '."");
 }
 elseif( $do == "switchto" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
   { 
     $name =  $_POST['name'];
     $command = "sudo -n /bin/bash -c \"$pwd/switchto.sh $name $debug >>$logfile 2>&1 & \" ";
     file_put_contents($logfile, $d."\n** Aktivire $name\n");
     shell_exec($command);   
    }
   header('Location: '."");
 }
 elseif( $do == "reswitchto" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
   { 
     $name =  $_POST['name'];
     $command = "sudo -n /bin/bash -c \"$pwd/reswitchto.sh $name $debug >>$logfile 2>&1 & \" ";
     file_put_contents($logfile, $d."\n** Reaktivire $name\n");
     shell_exec($command);   
    }
   header('Location: '."");
 }
 
 
 
elseif( $do == "zzz" )
 {
   $name="";
   if ( isset($_POST['name']) && $_POST['name']>'' )
        $name =  $_POST['name'];
   $command = "sudo /bin/bash -c \"$pwd/restoreschnap.sh $name $debug >>$logfile 2>&1 & \" ";
   file_put_contents($logfile, $d."\n** Aktiviere Schnappschuss **\n");
   shell_exec($command);   
   header('Location: '."");
 }
elseif( $do == "init" )
 { // nix tun, auch kein fressh starten
    $pwd= dirname($_SERVER['SCRIPT_FILENAME']); //  /var/www/html/switchboot/index.php
    $command = "sudo chown -R pi:pi $pwd ";
    $command = "sudo chown -R openwb:openwb $pwd ";
    shell_exec($command);
    $command = "sudo /bin/bash -c \"rm $logfile \" ";
    shell_exec($command);
    $command = "sudo chmod a+x $pwd/*.sh ";
    shell_exec($command);
    header('Location: '."");
 }
  else
 {
    foreach($_POST as $k => $v)
     debout("$k = [$v]");

 }
?>
<!DOCTYPE html>
<html lang="de">
	<head>
		<base href="/switchboot/">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Switchboot</title>
        <link rel="icon" type="image/png" href="./favicon.ico"/>
		<meta name="description" content="verwaltet bootdevices mmc/usb" />
		<meta name="keywords" content="html openWB" />
		<meta name="author" content="Heinz Hoefling" />
		<meta name="msapplication-TileColor" content="#00a8ff">
		<meta name="theme-color" content="#ffffff">
        <?php 
          if ($logend == 0 ) 
             echo "<meta http-equiv=\"refresh\" content=\"1\">";
        ?>
<style>

.wait { cursor: wait; }

* {
  box-sizing: border-box;
}

.band {
  background-color: #E9FBEF;
  padding:5px;
  text-align:center;  
}
.warnband {
  background-color: #FF280B;
  padding:5px;
  text-align:center;  
}
.dbgband {
  background-color: #f5f5f5;
  padding:5px;
  text-align:left;
  font-size:0.7em;  
}

.table {
  float: center;
  padding: 5px;
  font-size: 0.9em;  
}
th, caption {
  background-color: #f1f3f4;
  font-weight: 400;
}

@media only screen and (max-width: 620px) {
  /* For mobile phones: */
  .table .menu, .main, .right {
    width: 100%;
  }
}


button {
    border-radius: 3px;
    border: 1px solid #0000B2;
    padding:3px 7px 3px 7px;
    background: #F7F7F7;
    font-size: 0.8em;
    font-weight: 600;
    cursor: pointer;
}
textarea {
    border-radius: 3px;
    border: 1px solid #0000B2;
    padding:2px;
}

table, th, td {
  border: 2px solid #0000B2;
  border-collapse: collapse;
}

 th, td {
  padding: 8px;
}

input:invalid { background: hsl(5,30%,80%) }
input:valid   { border-color: blue}

summary::-webkit-details-marker,    
summary::marker {
  content:  "🡳"; /* Verwendung des "Pfeil"-Symbols anstelle des Dreiecks */
  color: green;
  font-size: 1em;
  font-weight: bold;
  /*transition: all 0.5s;*/  
}    
details[open] {
  background: #FFFFD7;
  padding-left: 1em;
  margin-bottom: 1em;
}

</style>

<?php

 if( $debug>6) 
  { echo "<pre>"; 
   debout( print_r($GLOBALS,true));
   debout( print_r($_SERVER,true));
   echo "</pre>";
   foreach($_POST as $k => $v)
     debout("$k = [$v]");
  }  
    
  function makebutton($name,$val,$text,$confirm,$extra="")   
  {
   $cf= ($confirm == "") ? ">" : "onsubmit=\"return confirm('$confirm');\">";
   $res="<form style=\"display: inline;\" action = \"\" method = \"post\" "
        . $cf
        . $extra 
        . "<button  name=\"$name\" value=\"$val\" title=\"$confirm\">$text</button>"
        . "</form>";
    return $res;
 }
 
 function getsystem($root)
 {
   global $debug;
   if( empty($root) ) 
      $root="/";
   $pwd= dirname($_SERVER['SCRIPT_FILENAME']); //  /var/www/html/switchboot/index.php
   $command = escapeshellcmd("sudo /bin/bash -c \"$pwd/getsys.sh $root  $debug \" 2>&1");
   debout( $command);
   $output = shell_exec($command);
   return $output;
 }
 function getowbinfo($root)
 {
   global $debug;
   if( empty($root) ) 
      $root="/";
   $pwd= dirname($_SERVER['SCRIPT_FILENAME']); //  /var/www/html/switchboot/index.php
   $command = escapeshellcmd("sudo /bin/bash -c \"$pwd/getowb.sh $root  $debug \" 2>&1");
   debout( $command);
   $output = shell_exec($command);
   return $output;
 }

 $bds = array('sda','sdb','sdc','sdd','mmcblk0');
 
 function scann($html)
 {
  global $bds,$debug;
  $res=[];
  debout('Scann nach Bootdevices...');
  
  $command = "sudo lsblk -J --output-all";
  exec($command, $data, $r);
  $data = implode('', $data);
  $data = json_decode($data);
  if( $debug>6)
   { 
    debout('<pre>');
    debout(print_r($data,true));
    debout('</pre>');
   } 
 
  foreach ($bds as $b)
   {
        debout($b);         
        foreach ($data->blockdevices as $o)
         {
          if( $o->name == $b )
           {
             if($debug > 3) 
              {
               debout('<pre>');
               debout(print_r($o,true));
               debout('</pre>');
              }  
           $o->but=''; 
           $o->but2='';
           $o->but3='';
           $o->version='';                   
           $o->boot='';                   
           $o->aktive='';
	   $o->owbinfo='';

           if( count($o->children) == 2)
           {
            if ( empty($o->children[0]->mountpoint)  )
                $o->but =makebutton('name', $o->name,' mount ',
                                  "Device ".$o->name." mounten.", 
                                  "<input type=\"hidden\" name=\"do\" value=\"mount\">" ); 
            else 
                {
                     if( trim($o->children[0]->mountpoint) == "/boot" )
                        {
                             $o->aktive="aktive";
                             if( file_exists( $o->children[0]->mountpoint . "/bootcode.bin") )
                                $o->aktive.= ' bootable';
                             if( file_exists( $o->children[0]->mountpoint . "/bootcode.no.bin") )
                             {
                                $o->aktive.= ' nicht bootable';
                                $o->but3=makebutton('name',$o->name,' Restore Boot next time ',
                                  "Next boot from ".$o->name, 
                                  "<input type=\"hidden\" name=\"do\" value=\"reswitchto\">" );
                            } 
                        }
                      else 
                        { 
                            $o->but =makebutton('name',$o->name,' umount ',
                                  'Device '.$o->name." unmounten.", 
                                  "<input type=\"hidden\" name=\"do\" value=\"umount\">" );
                            $o->but2=makebutton('name',$o->name,' Copy OWB-Data ',
                                  "Daten der OWN auf zu ".$o->name." kopieren.", 
                                  "<input type=\"hidden\" name=\"do\" value=\"latchowb\">" );
                                  
                            if( file_exists( $o->children[0]->mountpoint . "/bootcode.bin") )
                            {
                               $o->aktive='bootable';
                               $o->but3=makebutton('name',$o->name,' disable boot ',
                                  "Disable boot ".$o->name, 
                                  "<input type=\"hidden\" name=\"do\" value=\"unboot\">" );
                            } else {   
                                $o->aktive='nicht bootbar';

                            $o->but3=makebutton('name',$o->name,' Boot next time ',
                                  "Next boot from ".$o->name, 
                                  "<input type=\"hidden\" name=\"do\" value=\"switchto\">" );
                        }
                        }
                    debout('mountpoint(0) '.$o->children[0]->mountpoint );               
                    debout('mountpoint(1) '.$o->children[1]->mountpoint );               
                    //$cmd="cat " . $o->children[1]->mountpoint . "/etc/debian_version";
                    //$o->version=shell_exec($cmd);
                    $o->version = getsystem($o->children[1]->mountpoint."/");                   
                    $o->owbinfo = getowbinfo($o->children[1]->mountpoint."/");                   
                 }                    
           }
           
           $res[]=$o;
           }  
         }
        
        
   } 
  return $res; 
}

function getbootdevice()
{
   global $debug,$logfile;
   debout('getBootdevice');
   $command = "df ";
   $output = shell_exec($command);
   debout("<pre>");
   debout(print_r($output,true));
   debout("</pre>");

   $command = "df | grep ' /boot' | cut -f 1 -d ' ' ";
   $output = shell_exec($command);
   //debout(print_r($output,true));
   
   if( trim($output)=='/dev/sda1' )
        $ret='sda';
   else if( trim($output)=='/dev/sdb1' )
        $ret='sdb';
   else if( trim($output)=='/dev/sdc1' )
        $ret='sdc';
   else if( trim($output)=='/dev/sdd1' )
        $ret='sdd';
   else if( trim($output)=='/dev/mmcblk0p1' )
        $ret='mmcblk0';
   else $ret='Bootdevice nicht bestimmbar';
   
   debout('Bootdev is '.$ret);
   return $ret;
}

?>

</head>
<?php
         if( $logend==0) 
              echo "<body style=\"font-family:Verdana;color:#102030;\" class=\"wait\">";
         else
             echo "<body style=\"font-family:Verdana;color:#102030;\" >";
        $sys=getsystem('/');
        $bootdev=getbootdevice();
 ?>
        <div class="band">
          <h1 style="margin: 5px;"> Raspberry-Pi Bootverwaltung</h1>
          <?php echo "$sys auf $bootdev"; ?>
        </div>
        <div style="overflow:auto">
         <div class="table" >
          <!-- table -->
          <table style="width:100%;">
            <tr>
              <th>Device</th>
              <th style="width:20%;">Mountpoints</th>
              <th>OS-Version</th>
              <th style="width:30%;">Aktion</th>
            </tr>
            
            
        <?php
             $dates=[];
             if($logend != 0)
              {
                $rows=scann($html);
                foreach ($rows as $k => $d)
                {
                  printf("<tr><td><b>%s</b> %s<br>%s<br>%s %s<br>UUID: %s</td>",  
                         $d->name,   $d->size, $d->serial,
                         $d->vendor, $d->model, $d->ptuuid
                         );

                  if( count($d->children)==2  && ($d->children[0]->mountpoint!="") )
                   {
                    printf("<td>%s<br>%s</td>",
                    $d->children[0]->mountpoint,
                    $d->children[1]->mountpoint );
                   }
                  else echo "<td> nicht gemounted</td>";
                  
                  printf("<td>%s<br>%s<br>%s</td>",  
                         $d->version, 
                         $d->aktive,
			 $d->owbinfo
                        );
                   
                  printf("<td style='text-align: center;'>%s&nbsp;%s&nbsp;%s</td>",   
                          $d->but, 
                          $d->but2,
                          $d->but3);
                  echo "</tr>\n";         
                }    
             }
              
             $freemem=exec('df -k --output="avail" --block-size=1M / | tail -1  ');
             $freegb=($freemem / 1024);
                   
                   
           ?>
           </table>
           <!-- table -->
           <?php
                echo "<div class=\"band\" style=\"margin-top:2px;\">";
                printf("Es sind %2.1f GB frei auf dem Speichermedium", $freegb);
            ?>
            <?php
              echo makebutton('do','refresh','Refresh','',''); 
              echo "&nbsp;&nbsp;&nbsp;";
              echo makebutton('name','init','Module Init',
                               "Module neu initialisieren.\\nHierbei wird auch die Logdatei gelöschen.", 
                               '<input type="hidden" name="do" value="init">' ); 
            ?>
            </div>
         </div>
        </div>
         <div class="dbgband" style="margin-top:7px; text-aligne=left ">
         <?php
           if( count($dbg)>2 ) 
            echo "<details open >"; 
           else 
            echo "<details close >";     
         ?>
          <summary> Meldungen... </summary>
           <span>
            <?php
                 foreach ($dbg as  $k=>$d)
                  if( $d > "")
                   printf("%s<br>", $d);
            ?>
            </span>
          </details>         
         </div>
        <div class="band" style="margin-top:7px;">
          <!-- form name="f4" action="switcher.php?schnapper=1" method="post" autocomplete="off" -->
          
          <form action="" method="post" onsubmit="return confirm('Raspberry-Pi jetzt neu starten?');" autocomplete="off">
           <h4> Neustart auslösen</h4>
           <p>
            <input type="hidden" name="do" value="reboot">
            <button  name="do" value="reboot" >Neu starten</button>
           </p>
           </form>
        </div>
       <footer >
        <div class="band" style="margin-top:7px;">© Heinz Höfling 2023</div>
       </footer>
	</body>
</html>
