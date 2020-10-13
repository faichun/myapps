<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
  <xsl:param name="sortKey">title</xsl:param>
  <xsl:param name="sortOrder">ascending</xsl:param>
  <xsl:param name="sortType">text</xsl:param>
  <xsl:param name="filterKey">*</xsl:param>

  <xsl:template match="/">
    <div id="menu">
      <h2>My Movie Collection</h2>
      <table border="1">
        <tr bgcolor="#D8D8D8">
          <th>
            Type Filter:
            <input type="button" onclick="javascript: filter('*')" value="**"/>
            <input type="button" onclick="javascript: filter('科幻')" value="科幻"/>
            <input type="button" onclick="javascript: filter('喜劇')" value="喜劇"/>
            <input type="button" onclick="javascript: filter('動畫')" value="動畫"/>
            <input type="button" onclick="javascript: filter('動作')" value="動作"/>
            <input type="button" onclick="javascript: filter('冒險')" value="冒險"/>
            <input type="button" onclick="javascript: filter('魔幻')" value="魔幻"/>
            <input type="button" onclick="javascript: filter('紀錄')" value="紀錄"/>
            <input type="button" onclick="javascript: filter('警匪')" value="警匪"/>

          </th>
        </tr>
      </table>
    </div>

  </xsl:template>
  <xsl:template name="hdr">
    <xsl:param name="header" />
    <xsl:if test="$sortKey = $header">
      <xsl:if test="$sortOrder = 'ascending'"><font color="red">&#x25B2;</font></xsl:if>
      <xsl:if test="$sortOrder = 'descending'"><font color="red">&#x25BC;</font></xsl:if>
    </xsl:if>
    <xsl:if test="$sortKey != $header"></xsl:if>
  </xsl:template>
</xsl:stylesheet>
