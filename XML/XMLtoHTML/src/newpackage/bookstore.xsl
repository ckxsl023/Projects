<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bookstore.xsl
    Created on : 8 March 2022, 4:59 pm
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>bookstore.xsl</title>
            </head>
            <body>
            <p>1. Select the first book element that is the child of the bookstore element</p>
                <ul>
                    <li><xsl:value-of select="/bookstore/book[1]"/></li>
                </ul>
            <p>2. Select the last book element that is the child of the bookstore element</p>
                <ul>
                    <li><xsl:value-of select="/bookstore/book[last()]"/></li>
                </ul>
            <p>3. Selects the last but one book element that is the child of the bookstore element.</p>  
                <ul>
                    <li><xsl:value-of select="/bookstore/book[last()-1]"/></li>
                </ul>
            <p>4. Selects the first two book elements that are children of the bookstore element.</p>
                <ul>
                    <li><xsl:value-of select="/bookstore/book[1]"/></li>
                    <li><xsl:value-of select="/bookstore/book[2]"/></li>
                </ul>
            <p>5. Selects all the title elements that have an attribute named lang.</p>
                <xsl:for-each select="//title[@lang]">
                    </xsl:for-each>
                <xsl:for-each select="bookstore/book">
                <ul>
                  <li><xsl:value-of select="title"/></li>
                </ul>
                </xsl:for-each>
            <p>6. Selects all the title elements that have a "lang" attribute with a value of "en".</p>
                <xsl:for-each select="//title[@lang='en']">
                    </xsl:for-each>
                 <xsl:for-each select="bookstore/book">
                <ul>
                  <li><xsl:value-of select="title"/></li>
                </ul>
                </xsl:for-each>
            <p>7. Selects all the book elements of the bookstore element that have a price element with a value greater than 35.00</p>
                <ul>
                    <li><xsl:value-of select="/bookstore/book[price>35]"/></li>
                    <li><xsl:value-of select="/bookstore/book[price>35][2]"/></li>
                </ul>
            <p>8. Selects all the title elements of the book elements of the bookstore element that have a price element with a value greater than 35.00</p>
                <ul>
                    <li><xsl:value-of select="/bookstore/book[price>35]/title"/></li>
                    <li><xsl:value-of select="/bookstore/book[price>35][2]/title"/></li>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
