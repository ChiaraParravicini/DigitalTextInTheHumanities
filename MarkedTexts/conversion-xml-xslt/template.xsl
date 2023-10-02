<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0">

  <!-- Identity template: copia tutti gli elementi e attributi così come sono -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Template per l'elemento radice dell'HTML -->
  <xsl:template match="tei:TEI">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
      </head>
      <body>
        <div class="container">
          <div class="box left">
            <h2>Key Concepts</h2>
            <ul>
              <xsl:if test="tei:text/tei:front/tei:interpGrp/tei:interp">
                <xsl:for-each select="tei:text/tei:front/tei:interpGrp/tei:interp">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each>
              </xsl:if>
            </ul>
            <h2>Characters</h2>
            <ul>
              <xsl:if test="tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person/tei:persName">
                <xsl:for-each select="tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person/tei:persName">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each>
              </xsl:if>
            </ul>
          </div>
          <div class="box right">
            <xsl:value-of select="tei:text/tei:body"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>


</xsl:stylesheet>
