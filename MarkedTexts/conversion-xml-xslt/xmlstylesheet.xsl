<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
       <xsl:template match="TEI">
       <xsl:output method="text"/>
      <html>
        <body>
            <xsl:for-each select="teiHeader">
                <xsl:for-each select="fileDesc">
                    <xsl:for-each select="titleStmt">
                        <xsl:value-of select="title" />
                        <xsl:value-of select="author" />
                        <xsl:for-each select="respStmt">
                            <xsl:value-of select="resp" />
                            <xsl:value-of select="name" />
                        </xsl:for-each>
                    </xsl:for-each> 
                </xsl:for-each> 
            </xsl:for-each> 
            <xsl:for-each select="interpGrp">
                <xsl:value-of select="interp" />
            </xsl:for-each>
            <xsl:for-each select="text">
                <xsl:value-of select="persName" />
                <xsl:value-of select="roleName" />
                <xsl:value-of select="seg" />
            </xsl:for-each>
        </body>
      </html>
</xsl:template>
</xsl:stylesheet>