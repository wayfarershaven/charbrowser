<?php
/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   Portions of this program are derived from publicly licensed software
 *   projects including, but not limited to phpBB, Magelo Clone, 
 *   EQEmulator, EQEditor, and Allakhazam Clone.
 *
 *                                  Author:
 *                           Maudigan(Airwalking) 
 *
 *   April 16, 2020 - Maudigan
 *       Initial Revision
 *   April 25, 2020 - Maudigan
 *     implement multi-tenancy
 *
 ***************************************************************************/
  
 
/*********************************************
                 INCLUDES
*********************************************/ 
define('INCHARBROWSER', true);
include_once(__DIR__ . "/include/common.php");
include_once(__DIR__ . "/include/profile.php");
include_once(__DIR__ . "/include/db.php");
  
 
/*********************************************
         SETUP PROFILE/PERMISSIONS
*********************************************/
if(!$_GET['char']) cb_message_die($language['MESSAGE_ERROR'],$language['MESSAGE_NO_CHAR']);
else $charName = $_GET['char'];

//character initializations 
$char = new profile($charName, $cbsql, $cbsql_content, $language, $showsoftdelete, $charbrowser_is_admin_page); //the profile class will sanitize the character name
$charID = $char->char_id(); 
$name = $char->GetValue('name');
$mypermission = GetPermissions($char->GetValue('gm'), $char->GetValue('anon'), $char->char_id());

//block view if user level doesnt have permission
if ($mypermission['bots']) cb_message_die($language['MESSAGE_ERROR'],$language['MESSAGE_ITEM_NO_VIEW']);
 
 
/*********************************************
        GATHER RELEVANT PAGE DATA
*********************************************/
//get factions from the db
$tpl = <<<TPL
SELECT name, race, gender,
       class, face, level
FROM bot_data 
WHERE owner_id = %d 
ORDER BY name ASC 
TPL;
$query = sprintf($tpl, $charID);
$result = $cbsql->query($query);
if (!$cbsql->rows($result)) cb_message_die($language['BOTS_BOTS']." - ".$name,$language['MESSAGE_NO_BOTS']);


$bots = $cbsql->fetch_all($result);  
 
 
/*********************************************
               DROP HEADER
*********************************************/
$d_title = " - ".$name.$language['PAGE_TITLES_BOTS'];
include(__DIR__ . "/include/header.php");
 
 
/*********************************************
            DROP PROFILE MENU
*********************************************/
output_profile_menu($name, 'bots');
 
 
/*********************************************
              POPULATE BODY
*********************************************/
$cb_template->set_filenames(array(
   'bots' => 'bots_body.tpl')
);


$cb_template->assign_both_vars(array(  
   'NAME'        => $name)
);
$cb_template->assign_vars(array(  
   'L_BOTS'  => $language['BOTS_BOTS'], 
   'L_DONE'      => $language['BUTTON_DONE'])
);
  
foreach($bots as $bot) {
   $cb_template->assign_both_block_vars("bots", array( 
      'NAME'    => $bot['name'],
      'AVATAR_IMG' => getAvatarImage($bot['race'], $bot['gender'], $bot['face']),
      'RACE'    => $dbracenames[$bot['race']],
      'CLASS'   => $dbclassnames[$bot['class']],
      'LEVEL'    => $bot['level'])
   );
}
 
 
/*********************************************
           OUTPUT BODY AND FOOTER
*********************************************/
$cb_template->pparse('bots');

$cb_template->destroy;

include(__DIR__ . "/include/footer.php");
?>