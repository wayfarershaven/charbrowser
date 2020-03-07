<script type="text/javascript">
function display(type, id, prefix) {
  if (target = document.getElementById(prefix + id))
    if (type) target.style.display = (target.style.display == 'none') ? 'block' : 'none';
  else {
    for(var i=0; i < 2190; i++) if (hideme = document.getElementById(prefix + i)) hideme.style.display = 'none';    
    target.style.display = 'block';
  }
}
</script>

<div class='NavOuter'>
<div class='NavInner'>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=character&char={NAME}';" style="margin:3px">{L_INVENTORY}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=aas&char={NAME}';" style="margin:3px">{L_AAS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=keys&char={NAME}';" style="margin:3px">{L_KEYS}</div>
  <div class='FreeButton' style="color:606060;margin:3px">{L_FLAGS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=skills&char={NAME}';" style="margin:3px">{L_SKILLS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=corpse&char={NAME}';" style="margin:3px">{L_CORPSE}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=factions&char={NAME}';" style="margin:3px">{L_FACTION}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=charmove&char={NAME}';" style="margin:3px">{L_CHARMOVE}</div>
  <div class='FreeButton' onclick="window.external.AddFavorite(location.href, document.title);" style="margin:3px">{L_BOOKMARK}</div>
</div>
</div>
<center>
     <div class='SmallOuter'>
	<div class='SmallTitle'>
	  <div class='SmallTitleLeft'></div>
	  <div class='SmallTitleMid'>{L_FLAGS} - {NAME}</div>
	  <div class='SmallTitleRight'></div>
	</div>
	<div class='SmallInner'>
          <table class='StatTable' cellpadding='2px' style='width: 90%;'>
             <!-- BEGIN mainhead -->
	    <tr>
	      <td>&nbsp;</td>
	      <td valign='middle' width='100%' nowrap class='ColumnHead' align='center'>{mainhead.TEXT}</td>
	    </tr>
             <!-- BEGIN main -->
	    <tr>
	      <td><div class='check{mainhead.main.FLAG}'></div></td>
	      <td valign='middle' width='100%' nowrap><a href='#' onclick="display(0, {mainhead.main.ID}, 'flag');">&nbsp;{mainhead.main.TEXT}...</a></td>
	    </tr>
	    <!-- END main -->
	    <tr>
	      <td colspan='2'>&nbsp;</td>
	    </tr>
	    <!-- END mainhead -->
	    <tr><td colspan='2' align='center'><div class='FreeButton' onclick="window.location='{INDEX_URL}?page=character&char={NAME}';">{L_DONE}</div></td></tr>
	  </table>
	</div>
      </div>
      
      <br><br><br>

      <!-- BEGIN head -->
      <div class='FlagOuter' id='flag{head.ID}' style='display: none;'>
        <div class='FlagTitle'>
	  <div class='FlagTitleLeft'></div>
	  <div class='FlagTitleMid'>{head.NAME}</div>
	  <div class='FlagTitleRight'></div>
	</div>
	<div class='FlagInner'>
	  <table class='StatTable' style='width: 90%;'>
	    <!-- BEGIN flags -->
            <tr>
              <td><div class='check{head.flags.FLAG}'></div></td>
              <td valign='middle' width='100%' nowrap>{head.flags.TEXT}</td>
            </tr>
            <!-- END flags -->
          </table>
	</div>
      </div>
      <!-- END head -->
</center>