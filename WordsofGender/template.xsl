<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0">


  <!-- Identity template: copia tutti gli elementi e attributi così come sono -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Modifica il template per l'elemento 'tei:seg' -->
  <xsl:template match="tei:seg">
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="substring(@ana, 2)"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- Modifica il template per l'elemento 'tei:persName' -->
  <xsl:template match="tei:persName">
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="substring(@ref, 2)"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>


  <!-- Template per l'elemento radice dell'HTML -->
  <xsl:template match="tei:TEI">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
      </head>
      <body>
        <div id="title-text">
          <h2>From <i><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/></i>,
            by <span>
              <xsl:attribute name="id">
                <xsl:value-of select="substring-before(normalize-space(tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author), ' ')"/>
              </xsl:attribute>
              <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author"/>
            </span>
          </h2>
        </div>
        
        
        <div id="text">
          
          <div id="box-left">
            <ul>
              <xsl:if test="tei:text/tei:front/tei:interpGrp/tei:interp">
                <h2>Key Concepts</h2>
                    <xsl:for-each select="tei:text/tei:front/tei:interpGrp/tei:interp">
                    <li>
                      <button>
                        <xsl:attribute name="onclick">highlightElement('.<xsl:value-of select="@xml:id"/>')</xsl:attribute>
                        <xsl:value-of select="."/>
                      </button>
                    </li> 
                    </xsl:for-each>
              </xsl:if>
            </ul>

            <ul>
              <xsl:if test="tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person/tei:persName">
                <h2>Characters</h2>
                <xsl:for-each select="tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person">
                  <li>
                      <button>
                        <xsl:attribute name="onclick">highlightElement('.<xsl:value-of select="@xml:id"/>')</xsl:attribute>
                        <xsl:value-of select="."/>
                      </button>
                  </li>
                </xsl:for-each>
              </xsl:if>
            </ul>

            <!-- <xsl:element name="form">
              <xsl:attribute name="role">form</xsl:attribute>
              <div>
                  <button onclick="highlightElement('.mother')">Mother</button>
                  <button onclick="highlightElement('.virginity')">virginity</button>
                  <button onclick="highlightElement('.strength')">Strength</button>
              </div>
            </xsl:element> -->

          </div>

          <div id="box-right">
            <xsl:apply-templates select="tei:text/tei:body"/>
          </div>
          </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

