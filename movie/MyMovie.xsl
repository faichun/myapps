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
            <input type="button" onclick="javascript: filter('戰爭')" value="戰爭"/>
            <input type="button" onclick="javascript: filter('愛情')" value="愛情"/>
            <input type="button" onclick="javascript: filter('劇情')" value="劇情"/>
            <input type="button" onclick="javascript: filter('傳記')" value="傳記"/>
            <input type="button" onclick="javascript: filter('懸疑')" value="懸疑"/>
            <input type="button" onclick="javascript: filter('災難')" value="災難"/>
            <input type="button" onclick="javascript: filter('恐怖')" value="恐怖"/>
            <input type="button" onclick="javascript: filter('情色')" value="情色"/>
            <input type="button" onclick="javascript: filter('指南')" value="指南"/>
            <input type="button" onclick="javascript: filter('電視')" value="電視"/>
          </th>
        </tr>
      </table>
    </div>
    <table id="resultTable" border="1" width="100%">
      <tr bgcolor="#D8D8D8">
        <th><a href="javascript: resort('title');">Title</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'title'" /></xsl:call-template></th>
        <th><a href="javascript: resort('year');">Year</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'year'" /></xsl:call-template></th>
        <th><a href="javascript: resort('type');">Type</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'type'" /></xsl:call-template></th>
        <th><a href="javascript: resort('hasBackup');">Has Backup?</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'hasBackup'" /></xsl:call-template></th>
        <th><a href="javascript: resort('insertDTTM');">Insert Date/Time</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'insertDTTM'" /></xsl:call-template></th>
        <th><a href="javascript: resort('cinemaDTTM');">Cinema Date/Time</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'cinemaDTTM'" /></xsl:call-template></th>
      </tr>
      <xsl:for-each select="entries/entry">
        <xsl:sort select="*[name(.)=$sortKey]|@*[name(.)=$sortKey]" order="{$sortOrder}" data-type="{$sortType}" />
        <xsl:if test="$filterKey = '*' or type = $filterKey">
          <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="year"/></td>
            <td><xsl:value-of select="type"/></td>
            <td>
              <xsl:if test="hasBackup = 0">
                <xsl:text>No</xsl:text>
              </xsl:if>
              <xsl:if test="hasBackup = 1">
                <xsl:text>Yes</xsl:text>
              </xsl:if>
            </td>
            <td><xsl:value-of select="insertDTTM"/></td>
            <td>
              <xsl:if test="cinemaDTTM = ''">
                <xsl:text>--</xsl:text>
              </xsl:if>
              <xsl:if test="cinemaDTTM != ''">
                <xsl:value-of select="cinemaDTTM"/>
              </xsl:if>
            </td>
          </tr>
        </xsl:if>
      </xsl:for-each>
    </table>
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
