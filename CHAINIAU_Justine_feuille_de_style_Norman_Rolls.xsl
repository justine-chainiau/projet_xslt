<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- 1. INSTRUCTION D'OUTPUT : LATEX -->
    
    <xsl:output method="text" indent="yes"/>

    <!-- 2. DÉCLARATION DE VARIABLE : Chemin du fichier de sortie -->
    
    <xsl:variable name="Norman_Rolls_latex">
        <xsl:value-of select="concat('Norman_Rolls_latex','.tex')"/>
    </xsl:variable>
    
    <!-- 3.TEMPLATE MATCH SUR LA RACINE -->
    
    <xsl:template match="/">
        <!-- 3.1. Template de la page text -->
        <xsl:result-document href="{$Norman_Rolls_latex}" method="text">
       
    <!-- 4. COMMANDES LATEX : Chargement des paquets de mise en page / métadonnées relatives au document -->
            
    <xsl:text>\documentclass[a4paper,12pt,twoside]{book}
    \usepackage[Conny]{fncychap}
    
    \usepackage[splitindex]{imakeidx}
    \makeindex[name=indiv,title=Index des noms de personnes]
   
    \usepackage{hyperref}
    \hypersetup{
    pdfauthor = {Justine, Chainiau},
    pdftitle = {Calendar of the Norman Rolls - Henry V - Edition First Part},
    pdfsubject = {Norman Rolls},
    pdfkeywords = {rouleaux} {Henry V} {guerre de Cent Ans} {Normandie}
    }
    
    \usepackage[T1]{fontenc}
    \usepackage[english,french]{babel}
    
    \usepackage[margin=2.5cm]{geometry} 
    \usepackage{setspace} 
    \onehalfspacing 
    \setlength\parindent{1cm}</xsl:text>
        
    <!-- 5. PAGE DE TITRE / TABLE DES MATIÈRES -->
    
    <xsl:text>\begin{document}
    <!-- 5.1. Page de titre -->
	\begin{titlepage}
		\begin{center}
			
			
			\bigskip
			\bigskip
			\bigskip
			\begin{Large}</xsl:text>
                <!-- 5.1.1. Nom du responsable de l'édition : contenu du persName du respStmt -->
				\textbf{<xsl:value-of select="//editionStmt/respStmt/persName"/>}\\
			<xsl:text>\end{Large}
			
			\bigskip
			\bigskip
			\bigskip
			\begin{center}\rule{2cm}{0.02cm}\end{center}
			\bigskip
			\bigskip
			\bigskip
			
			\begin{Huge}</xsl:text>
                <!-- 5.1.2. Titre de l'édition : contenu du titre -->
				\textbf{<xsl:value-of select="//titleStmt/title"/>}\\
			<xsl:text>\end{Huge}
			\bigskip
			\bigskip
			
			
			\bigskip
			\bigskip
			\bigskip
			\begin{large}
			\end{large}
			\vfill
			
			\begin{large}</xsl:text>
                <!-- 5.1.3. Titre du devoir : contenu de edition -->
                <xsl:value-of select="//editionStmt/edition"/>
            <!-- 5.1.4. Date -->
            <xsl:text>2023</xsl:text>
			<xsl:text>\end{large}
			
		\end{center}
	\end{titlepage}
	\newpage</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>
    <!-- 5.2. Affichage de la table des matières cliquable après la page de titre -->
    \tableofcontents   
    </xsl:text>         
	
    <!-- 6. RÉSUMÉ / PRÉSENTATION DE LA SOURCE --> 
            
	<xsl:text>
    <!-- 6.1. Premire chapitre : résumé -->
	\chapter{Résumé}
	\medskip</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <!-- 6.1.1. Résumé de la présente édition : contenu des balises title et persName du respStmt -->
	<xsl:text> Contient \textit{</xsl:text><xsl:value-of select="//titleStmt/title"/><xsl:text>}, par </xsl:text><xsl:value-of select="//editionStmt/respStmt/persName"/><xsl:text>.</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\bigskip</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\begin{Large} </xsl:text>
    <!-- 6.2. Section : présentation du projet d'édition : contenu du projectDesc -->
    \section{<xsl:value-of select="//projectDesc/p"/>}
    <xsl:text>\end{Large}</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\medskip</xsl:text>
    <xsl:text>
        
    </xsl:text>     
    <!--  6.2.1. Affichage du contenu du paragraphe de présentation du projet d'encodage (dans l'encodingDesc) -->
    <xsl:value-of select="//encodingDesc/p"/>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\bigskip</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\begin{Large}</xsl:text>
    <!-- 6.3. Section : présentation de la source : contenu du titre de la source -->
    \section{<xsl:value-of select="//bibl/title[@type='main']"/>}
    <xsl:text>\end{Large}</xsl:text>
    <xsl:text>
        
    </xsl:text>
    <xsl:text>\medskip</xsl:text>
    <xsl:text>
        
    </xsl:text>  
    <!-- 6.3.1. Affichage du contenu du paragraphe de présentation de la source (dans le settingDesc) -->
    <xsl:value-of select="//settingDesc/p"/>
    <xsl:text>
        
    </xsl:text>   
    <xsl:text>
    \newpage
    </xsl:text>
    
    <!-- 7. STRUCTURATION DES CHAPITRES -->
            
    <!-- 7.1. Deuxième chapitre : édition du contenu des rouleaux -->
    <xsl:text>\chapter{Norman Rolls}</xsl:text>
        <!-- 7.1.2. Application des règles (xsl:template) aux enfants des <div> -->
        <xsl:apply-templates select="//body/div"/>  
        <!-- 7.2. Commandes latex relatives à l'affichage de l'index des noms de personnes à la fin du document -->
        \printindex[indiv]
        \addcontentsline{toc}{chapter}{Index des noms de personnes}
        \end{document}
        
      </xsl:result-document>
    </xsl:template> 
    
    <!-- 8. CONTENU DES ROULEAUX --> 
    
    <!-- 8.1. Template match sur les div -->
    <xsl:template match="//body/div">
        <!-- 8.1.2. Première boucle sur les div -->
        <xsl:for-each select=".">
            <!-- 8.1.3. Affichage des valeurs attribuées aux div (type = membrane, n = ...) -->
            \section{Membrane <xsl:value-of select="@n"/>}
            <!-- 8.2. Deuxième boucle sur les event -->
            <xsl:for-each select="//event">
                <!-- 8.2.1. Sous-section : Affichage des valeurs attribuées aux event (when et where) par concaténation -->
                \subsection{<xsl:value-of select="concat(./@when,', ',./@where)"/>}
                <!-- 8.2.2. Application des règles aux enfants -->
                <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>
                \newpage
            </xsl:text>
        </xsl:for-each>
    </xsl:template>   
    
    <!-- 9. INDEX --> 
   
    <!-- 9.1. Template match sur les persName -->
    <xsl:template match="//body//persName">
        <!-- 9.1.2. Boucle sur les persName -->
        <xsl:for-each select=".">
            <!-- 9.1.3. Affichage du contenu des persName dans l'index -->
            <xsl:apply-templates/><xsl:text>\index[indiv]{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
        </xsl:for-each>
    </xsl:template>
            
</xsl:stylesheet>