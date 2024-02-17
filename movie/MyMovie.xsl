<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
  <xsl:param name="sortKey">title</xsl:param>
  <xsl:param name="sortOrder">ascending</xsl:param>
  <xsl:param name="sortType">text</xsl:param>
  <xsl:param name="filterKey">*</xsl:param>
  <xsl:param name="filterTitle">*</xsl:param>

  <xsl:template match="/">
    <div class="jumbotron bg-primary text-light">
      <h1><b>My Movie Collection (version 3)</b></h1>
    </div>
    <div class="row">
      <div class="col-sm-12 bg-light text-dark">
        <table id="resultTable" class="table table-striped">
          <thead>
            <tr>
              <th colspan="6" bgcolor="#2A3B4C">
                <input type="button" class="btn btn-success" onclick="javascript: filter('*')" value="全部"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('科幻')" value="科幻"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('喜劇')" value="喜劇"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('動畫')" value="動畫"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('動作')" value="動作"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('冒險')" value="冒險"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('魔幻')" value="魔幻"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('紀錄')" value="紀錄"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('警匪')" value="警匪"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('戰爭')" value="戰爭"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('愛情')" value="愛情"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('劇情')" value="劇情"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('傳記')" value="傳記"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('懸疑')" value="懸疑"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('災難')" value="災難"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('恐怖')" value="恐怖"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('情色')" value="情色"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('指南')" value="指南"/>
                <input type="button" class="btn btn-secondary" onclick="javascript: filter('電視')" value="電視"/>
                <input type="button" class="btn btn-primary" onclick="location.href='https://faichun.github.io/myapps/';" value="主頁" />
              </th>
            </tr>
            <tr>
              <th colspan="6">
                <input id="titleFilterInput" type="text" class="form-control mr-sm-2" onkeyup="javascript: getTitle();" placeholder="Search for titles.."/>
              </th>
            </tr>
            <tr>
              <th><a href="javascript: resort('title');">Title</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'title'" /></xsl:call-template></th>
              <th><a href="javascript: resort('year');">Year</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'year'" /></xsl:call-template></th>
              <th><a href="javascript: resort('type');">Type</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'type'" /></xsl:call-template></th>
              <th><a href="javascript: resort('hasBackup');">Has Backup?</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'hasBackup'" /></xsl:call-template></th>
              <th><a href="javascript: resort('insertDTTM');">Insert Date/Time</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'insertDTTM'" /></xsl:call-template></th>
              <th><a href="javascript: resort('viewSource');">Source</a><xsl:call-template name="hdr"><xsl:with-param name="header" select="'viewSource'" /></xsl:call-template></th>
            </tr>
          </thead>
          <tbody>
          <xsl:for-each select="entries/entry">
            <xsl:sort select="*[name(.)=$sortKey]|@*[name(.)=$sortKey]" order="{$sortOrder}" data-type="{$sortType}" />
            <xsl:if test="($filterKey = '*' or type = $filterKey)">
            <xsl:variable name="lowercase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
            <xsl:variable name="uppercase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
            <xsl:if test="($filterTitle = '*' or (contains(translate(title, $uppercase, $lowercase), translate($filterTitle, $uppercase, $lowercase))))">
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
                <xsl:if test="viewSource = ''">
                  <xsl:text>--</xsl:text>
                </xsl:if>
                <xsl:if test="viewSource != ''">
                  <xsl:value-of select="viewSource"/>
                </xsl:if>
              </td>
            </tr>
            </xsl:if>
            </xsl:if>
          </xsl:for-each>
          </tbody>
        </table>
      </div>
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
