<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
  <xsl:param name="filterQuestion">*</xsl:param>

  <xsl:template match="/">
    <div class="jumbotron bg-primary text-light">
      <h1><b>My Interview Cheatsheet (version 1)</b></h1>
    </div>
    <div class="row">
      <div class="col-sm-12 bg-light text-dark">
        <table id="resultTable" class="table table-striped">
          <thead>
            <tr>
              <th colspan="6" bgcolor="#2A3B4C">
                <input type="button" class="btn btn-primary" onclick="javascript: goQuestionBank('OS')" value="OS"/>
                <input type="button" class="btn btn-primary" onclick="javascript: goQuestionBank('NETWORKING')" value="Networking"/>
                <input type="button" class="btn btn-success" onclick="location.href='https://faichun.github.io/myapps/';" value="MyApps" />
              </th>
            </tr>
            <tr>
              <th colspan="6">
                <input id="questionFilterInput" type="text" class="form-control mr-sm-2" onkeyup="javascript: getQuestion();" placeholder="Search questions ..."/><input type="button" class="btn btn-primary" onclick="javascript: goQuestionBank('NETWORKING')" value="Networking"/>
              </th>
            </tr>
            <tr>
              <th>Type</th>
              <th>Question</th>
              <th>Answer</th>
              <th>Remarks</th>
            </tr>
          </thead>
          <tbody>
          <xsl:for-each select="entries/entry">
            <xsl:variable name="lowercase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
            <xsl:variable name="uppercase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
            <xsl:if test="($filterQuestion = '*' or (contains(translate(question, $uppercase, $lowercase), translate($filterQuestion, $uppercase, $lowercase))))">
            <tr>
              <td><xsl:value-of select="type"/></td>
              <td><xsl:value-of select="question"/></td>
              <td><xsl:value-of select="answer"/></td>
              <td><xsl:value-of select="remarks"/></td>
            </tr>
            </xsl:if>
          </xsl:for-each>
          </tbody>
        </table>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
