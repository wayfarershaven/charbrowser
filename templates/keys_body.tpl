<div class='NavOuter'>
<div class='NavInner'>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=character&char={NAME}';" style="margin:3px">{L_INVENTORY}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=aas&char={NAME}';" style="margin:3px">{L_AAS}</div>
  <div class='FreeButton' style="color:606060;margin:3px">{L_KEYS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=flags&char={NAME}';" style="margin:3px">{L_FLAGS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=skills&char={NAME}';" style="margin:3px">{L_SKILLS}</div>
  <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=factions&char={NAME}';" style="margin:3px">{L_FACTION}</div>
</div>
</div>
<center>
  <div class='ItemOuter'>
    <div class='ItemTitle'>
      <div class='ItemTitleLeft'></div>
      <div class='ItemTitleMid'>{L_KEY} - {NAME}</div>
      <div class='ItemTitleRight'></div>
    </div>
    <div class='ItemInner'>
      <table class='StatTable' style='width:90%;'>
          <tr>
            <td class='ColumnHead' align='center'>{L_KEY}</td>	
          </tr>
        <!-- BEGIN keys -->
          <tr>
            <td nowrap><a href='{keys.LINK}'>{keys.KEY}</a></td>
          </tr>
        <!-- END keys -->
      </table>
      <br><br>
      <div class='FreeButton' onclick="window.location='{INDEX_URL}?page=character&char={NAME}';">{L_DONE}</div>
    </div>
  </div>
</center>

