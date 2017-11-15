\documentclass[11pt, oneside]{scrbook}
\usepackage[utf8]{inputenc}
% -------------------------------------------------
% page layout:
\setlength\parindent{0pt}
\usepackage{tgbonum}
\usepackage[a4paper]{geometry}
\usepackage{listings}
\usepackage{ragged2e}
\usepackage{pifont}
\usepackage{mathptmx}
\usepackage[11pt]{moresize}
\newlength\imargin
\newlength\omargin
\setlength\imargin{.7in}
\setlength\omargin{.7in}
\geometry{
  inner  = \imargin ,
  outer  = \omargin ,
  top    = 1.2in ,
  bottom = .7in,
  left   = 1in,
  right  = 1in
}

% -------------------------------------------------
% colors:
\usepackage{tikz,xcolor}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{positioning}
\definecolor{darkred}{cmyk}{.97, .78, .39, .29}
\colorlet{mygray}{black!20}

% -------------------------------------------------
% header and footer:
\usepackage{scrpage2}
\pagestyle{scrheadings}
\renewcommand*\chapterpagestyle{scrheadings}
\clearscrheadfoot

\newcommand*\logo{%
	\includegraphics[width=.8in]{logo.png}}
  %\textcolor{darkred}{\scalebox{1.3}{ITALIAN} \scalebox{2}{SRD}} \      d20\scalebox{2}{MODERN}}
\tikzset{
  logo/.style={
    color = mygray ,
    font  = \normalfont\sffamily\Large\bfseries ,
    inner sep = .25in ,
    align = center
  },
  page/.style={
    color  = mygray ,
    fill   = darkred ,
    font   = \normalfont\sffamily\Huge\bfseries ,
    minimum size = \omargin-.2in ,
    yshift = 2in
  },
  chapter/.style={
    color = mygray ,
    scale = 1.5 ,
    transform shape ,
    font  = \normalfont\sffamily\Huge\bfseries ,
  }
}
\ohead{
\begin{tikzpicture}[remember picture, overlay]
 % logo:
 \ifthispageodd
   {\node[below left,logo] at (current page.north east)}
   {\node[below left,logo] at (current page.north east)}
   {\logo} ;
 % page number:
 \ifthispageodd
   {\node[left,page] at (current page.east)}
   {\node[left,page] at (current page.east)}
   {\thepage} ;
 % chapter mark:
 \ifthispageodd
   {\node[anchor=north east,rotate=-90,chapter] at (current page.south east)}
   {\node[anchor=north east,rotate=-90,chapter] at (current page.south east)}
   {\chaptertitle} ;
 \ifthispageodd
   {
     \draw[mygray,very thin]
       (current page.south east)++(-.6in,0)--++(0,.6\paperheight) ;
   }
   {
     \draw[mygray,very thin]
       (current page.south east)++(-.6in,0)--++(0,.6\paperheight) ;
   }
\end{tikzpicture}
}

% -------------------------------------------------
% chapter layout:
\usepackage{etoolbox}
\newbool{schapter}
\makeatletter
\patchcmd\@chapter
  {\ifnum \scr@osectarg}
  {\boolfalse{schapter}\ifnum \scr@osectarg}
  {}{\error}
\patchcmd\@schapter
  {\if@twocolumn}
  {\booltrue{schapter}\if@twocolumn}
  {}{\error}
\patchcmd\@chapter
  {\@topnewpage[\@makechapterhead{#2}]}
  {\@topnewpage[\@makechapterhead{#2}]\null\newpage\vspace*{1in}}
  {}{\error}
\patchcmd\@schapter
  {\@topnewpage[\@makeschapterhead{#1}]}
  {\@topnewpage[\@makeschapterhead{#1}]\null\newpage\vspace*{1in}}
  {}{\error}
\makeatother

\newcommand\savechapter[1]{\gdef\chaptertitle{#1}}
\newcommand*\chapterbox[1]{%
  \savechapter{#1}%
  \begin{tikzpicture}[remember picture, overlay]
   \draw (current page.north) ++(0,-2in)
     node[mygray,fill=darkred!50,inner sep=1em, align=right,  minimum width=\textwidth]
       (chapapp)
       {\ifbool{schapter}{}{\rlap{\Huge}}} ;
   \node[anchor=north,mygray,fill=darkred!75,inner sep=1em,xshift=-.6in, minimum width=\textwidth]
     at (chapapp.south)
     {\scalebox{2.5}{\bfseries\MakeUppercase{#1}\hspace*{.2in}}} ;
  \end{tikzpicture}
}
\setkomafont{chapter}{\chapterbox}

% -------------------------------------------------
% section layout:
\setcounter{secnumdepth}{0}
\newcommand\sectionrule{%
  \makebox[0pt][l]{\rule[-.25ex]{\linewidth}{1pt}}}
\newcommand\sectionformat[1]{%
  \sffamily\huge\color{darkred}%
  \sectionrule
  \hfill\MakeUppercase{#1}}
\setkomafont{section}{\sectionformat}

% -------------------------------------------------
\usepackage{lipsum}% dummy text

\usepackage{tikz-er2}
\usepackage{amsmath}
\usepackage{epigraph}
\usepackage{lipsum}

\renewcommand\epigraphflush{flushright}
\renewcommand\epigraphsize{\normalsize}
\setlength\epigraphwidth{0.7\textwidth}

\definecolor{titlepagecolor}{cmyk}{1,.60,0,.40}

\DeclareFixedFont{\titlefont}{T1}{ppl}{b}{it}{0.5in}

\makeatletter                       
\def\printauthor{%                  
    {\large \@author}}              
\makeatother
\author{%
    {\bf Amrit Raj} \\     
    \textsl{Department of Computer Science} \       \texttt{amrit781@gmail.com} \\
    \texttt{ENROLLMENT NO. : 2013IMSCS001}
    }

\newcommand\titlepagedecoration{%
\begin{tikzpicture}[remember picture,overlay,shorten >= -10pt]

\coordinate (aux1) at ([yshift=-15pt]current page.north east);
\coordinate (aux2) at ([yshift=-410pt]current page.north east);
\coordinate (aux3) at ([xshift=-4.5cm]current page.north east);
\coordinate (aux4) at ([yshift=-150pt]current page.north east);

\begin{scope}[titlepagecolor!40,line width=12pt,rounded corners=12pt]
\draw
  (aux1) -- coordinate (a)
  ++(225:5) --
  ++(-45:5.1) coordinate (b);
\draw[shorten <= -10pt]
  (aux3) --
  (a) --
  (aux1);
\draw[opacity=0.6,titlepagecolor,shorten <= -10pt]
  (b) --
  ++(225:2.2) --
  ++(-45:2.2);
\end{scope}
\draw[titlepagecolor,line width=8pt,rounded corners=8pt,shorten <= -10pt]
  (aux4) --
  ++(225:0.8) --
  ++(-45:0.8);
\begin{scope}[titlepagecolor!70,line width=6pt,rounded corners=8pt]
\draw[shorten <= -10pt]
  (aux2) --
  ++(225:3) coordinate[pos=0.45] (c) --
  ++(-45:3.1);
\draw
  (aux2) --
  (c) --
  ++(135:2.5) --
  ++(45:2.5) --
  ++(-45:2.5) coordinate[pos=0.3] (d);   
\draw 
  (d) -- +(45:1);
\end{scope}
\end{tikzpicture}%
}
\newcommand{\HRule}{\rule{\linewidth}{0.4mm}}
\begin{document}
\begin{titlepage}


\begin{center}
%\titlefont \textsc{\HUGE Integrated Admission} \\[.3cm] \textsc{\HUGE Portal}
\includegraphics[width=5.4in]{images/title2.png}
\end{center}

\begin{center}
\null\vfill
\includegraphics[width=4in]{logo.png}
\end{center}
\null\vfill
\vspace*{1cm}

\hfill
\begin{minipage}{0.35\linewidth}
    
\end{minipage}
\begin{minipage}{.12\linewidth}
	\begin{flushright}
		\rule{1pt}{90pt}
	\end{flushright}
\end{minipage}
\begin{minipage}{0.43\linewidth}
    \begin{flushright}
    	\textsc{\large Submitted By :} \\
        \printauthor
    \end{flushright}
\end{minipage}
%
\begin{minipage}{0.02\linewidth}
    \rule{1pt}{90pt}
\end{minipage}
\titlepagedecoration
\end{titlepage}

\newpage

\chapter{Introduction}
\bigskip \bigskip \bigskip \bigskip \bigskip \bigskip
\section{Knowledge Discovery in Databases (KDD)}
The knowledge discovery in databases (KDD) process is commonly defined with the stages: 
 
(1) Selection 
 
(2) Pre-processing 
 
(3) Transformation 
 
(4) \textit{Data mining} 
 
(5) Interpretation/evaluation. 
\vspace{12pt}
 
Or a simplified process such as (1) Pre-processing, (2) Data Mining, and (3) Results Validation. 
\vspace{12pt}
 
\subsection{Pre-Processing}
 
Before data mining algorithms can be used, a target data set must be assembled. As data mining can only uncover patterns actually present in the data, the target data set must be large enough to contain these patterns while remaining concise enough to be mined within an acceptable time limit. The target set is then cleaned. Data cleaning removes the observations containing noise and those with missing data. 

 
\subsection{Data Mining}
 
 
Data mining involves five common classes of tasks: 
 
\begin{itemize}
\item \textit{Association rule learning }\textit{(dependency modelling) }– Searches for relationships between variables. For example, a supermarket might gather data on customer purchasing habits. Using association rule learning, the supermarket can determine which products are frequently bought together and use this information for marketing purposes. This is sometimes referred to as market basket analysis. 
 
\item \textit{Clustering} – is the task of discovering groups and structures in the data that are in some way or another "similar", without using known structures in the data. 
 
\item \textit{Classification} – is the task of generalizing known structure to apply to new data. For example, an e-mail program might attempt to classify an e-mail as "legitimate" or as "spam". 
 
\item \textit{Regression} – attempts to find a function which models the data with the least error that is, for estimating the relationships among data or datasets. 
 
\item \textit{Summarization} – providing a more compact representation of the data set, including visualization and report generation.\end{itemize}
 
\vspace{12pt}
 
\subsection{Results validation}
 
The final step of knowledge discovery from data is to verify that the patterns produced by the data mining algorithms occur in the wider data set. Not all patterns found by the data mining algorithms are necessarily valid. It is common for the data mining algorithms to find patterns in the training set which are not present in the general data set. This is called overfitting. To overcome this, the evaluation uses a test set of data on which the data mining algorithm was not trained. The learned patterns are applied to this test set, and the resulting output is compared to the desired output. For example, a data mining algorithm trying to distinguish "spam" from "legitimate" emails would be trained on a training set of sample e-mails. Once trained, the learned patterns would be applied to the test set of e-mails on which it had \textit{not }been trained. The accuracy of the patterns can then be measured from how many e-mails they correctly classify. A number of statistical methods may be used to evaluate the algorithm, such as ROC curves. 
 
If the learned patterns do not meet the desired standards, subsequently it is necessary to re-evaluate and change the pre-processing and data mining steps. If the learned patterns do meet the desired standards, then the final step is to interpret the learned patterns and turn them into knowledge. 
\vspace{12pt}
 
\chapter{Clustering}
\bigskip \bigskip \bigskip \bigskip \bigskip \bigskip
 
Clustering is the task of grouping a set of objects in such a way that objects in the same group (called a cluster) are more similar (in some sense or another) to each other than to those in other groups (clusters). 
\vspace{12pt}
 

\section{Requirements of Clustering}
 
 
The following points throw light on why clustering is required in data mining  $ - $ 
 
\begin{itemize}
\item Scalability  $ - $ We need highly scalable clustering algorithms to deal with large databases. 
 
\item Ability to deal with different kinds of attributes  $ - $ Algorithms should be capable to be applied on any kind of data such as interval-based (numerical) data, categorical, and binary data. 
 
\item Discovery of clusters with attribute shape  $ - $ The clustering algorithm should be capable of detecting clusters of arbitrary shape. They should not be bounded to only distance measures that tend to find spherical cluster of small sizes. 
 
\item High dimensionality  $ - $ The clustering algorithm should not only be able to handle low-dimensional data but also the high dimensional space. 
 
\item Ability to deal with noisy data  $ - $ Databases contain noisy, missing or erroneous data. Some algorithms are sensitive to such data and may lead to poor quality clusters. 
 
\item Interpretability  $ - $ The clustering results should be interpretable, comprehensible, and usable.\end{itemize}
 
\vspace{12pt}
 
\section{Clustering Methods}
 
 
Clustering methods can be classified into the following categories  $ - $ 
 
\begin{itemize}
\item Partitioning Method 
 
\item Hierarchical Method 
 
\item Density-based Method 
 
\item Grid-Based Method 
 
\item Model-Based Method 
 
\item Constraint-based Method\end{itemize}
 
 

\vspace{\baselineskip}
\textbf{\textit{Partitioning Method}} 
 
Suppose we are given a database of ‘n’ objects and the partitioning method constructs ‘k’ partition of data. Each partition will represent a cluster and k  $  \leq  $ n. It means that it will classify the data into k groups, which satisfy the following requirements  $ - $ 
 
\begin{itemize}
\item Each group contains at least one object. 
 
\item Each object must belong to exactly one group.\end{itemize}
 
\vspace{12pt}
 
\textbf{\textit{Hierarchical Methods}} 
 
 
This method creates a hierarchical decomposition of the given set of data objects. We can classify hierarchical methods on the basis of how the hierarchical decomposition is formed. There are two approaches here  $ - $ 
 
\begin{itemize}
\item Agglomerative Approach 
 
\item Divisive Approach\end{itemize}
 
 \vspace{12pt}
 
\textit{Agglomerative Approach}
 
 
This approach is also known as the bottom-up approach. In this, we start with each object forming a separate group. It keeps on merging the objects or groups that are close to one another. It keep on doing so until all of the groups are merged into one or until the termination condition holds. 
\vspace{12pt}
 
\textit{Divisive Approach}
 
 
This approach is also known as the top-down approach. In this, we start with all of the objects in the same cluster. In the continuous iteration, a cluster is split up into smaller clusters. It is down until each object in one cluster or the termination condition holds. This method is rigid, i.e., once a merging or splitting is done, it can never be undone. 
\vspace{12pt}
 
\textbf{\textit{Density-based Method}}
 
 
This method is based on the notion of density. The basic idea is to continue growing the given cluster as long as the density in the neighborhood exceeds some threshold, i.e., for each data point within a given cluster, the radius of a given cluster has to contain at least a minimum number of points. 
\vspace{12pt}
 
\textbf{\textit{Grid-based Method}}
 
 
In this, the objects together form a grid. The object space is quantized into finite number of cells that form a grid structure. 
\vspace{12pt}
 
\textbf{\textit{Model-based methods}}
 
 
In this method, a model is hypothesized for each cluster to find the best fit of data for a given model. This method locates the clusters by clustering the density function. It reflects spatial distribution of the data points. 
 
This method also provides a way to automatically determine the number of clusters based on standard statistics, taking outlier or noise into account. It therefore yields robust clustering methods. 
\vspace{12pt}
 
\textbf{\textit{Constraint-based Method}}
 
 
In this method, the clustering is performed by the incorporation of user or application-oriented constraints. A constraint refers to the user expectation or the properties of desired clustering results. Constraints provide us with an interactive way of communication with the clustering process. Constraints can be specified by the user or the application requirement. 
\vspace{12pt}
 

\chapter{Methods Implemented}
\bigskip \bigskip \bigskip \bigskip \bigskip \bigskip
 
\section{K – Means} 
\vspace{12pt}
 
\emph{K}-means clustering is a type of unsupervised learning, which is used when you have unlabeled data (i.e., data without defined categories or groups). The goal of this algorithm is to find groups in the data, with the number of groups represented by the variable \emph{K}. The algorithm works iteratively to assign each data point to one of \emph{K }groups based on the features that are provided. Data points are clustered based on feature similarity. The results of the \emph{K}-means clustering algorithm are: 
 
\begin{itemize}
\item 1. The centroids of the \emph{K }clusters, which can be used to label new data 
 
\item 2. Labels for the training data (each data point is assigned to a single cluster)\end{itemize}
 
\vspace{12pt}
 
\textit{Each centroid of a cluster is a collection of feature values which define the resulting groups. Examining the centroid }\textit{feature weights can be used to qualitatively interpret what kind of group each cluster represents.} 
\vspace{12pt}
\vspace{12pt}
 
\section{DBSCAN} 
 
Density-based spatial clustering of applications with noise is a data clustering algorithm proposed by Martin Ester, Hans-Peter Kriegel, Jörg Sander and Xiaowei Xu in 1996. It is a density-based clustering algorithm because it finds a number of clusters starting from the estimated density distribution of corresponding nodes. 
\vspace{12pt}
 
DBSCAN does not require one to specify the number of clusters in the data a priori, as opposed to k-means. DBSCAN can find arbitrarily shaped clusters. It can even find a cluster completely surrounded by (but not connected to) a different cluster. Due to the MinPts parameter, the so-called single-link effect (different clusters being connected by a thin line of points) is reduced. DBSCAN has a notion of noise. DBSCAN requires just two parameters and is mostly insensitive to the ordering of the points in the database. (However, points sitting on the edge of two different clusters might swap cluster membership if the ordering of the points is changed, and the cluster assignment is unique only up to isomorphism.) DBSCAN is designed for use with databases that can accelerate region queries, e.g. using an R* tree. 
\vspace{12pt}
 
\section{BIRCH} 
\vspace{12pt}
 
BIRCH (Balanced Iterative Reducing and Clustering using Hierarchies) 
 
\begin{itemize}
\item It is a scalable clustering method. 
 
\item Designed for very large data sets 
 
\item Only one scan of data is necessary 
 
\item It is based on the notation of CF (Clustering Feature) a CF Tree. 
 
\item CF tree is a height balanced tree that stores the clustering features for a hierarchical clustering. 
 
\item Cluster of data points is represented by a triple of numbers (N,LS,SS) Where 
 
\begin{itemize}
\item N= Number of items in the sub cluster 
 
\item LS=Linear sum of the points 
 
\item SS=sum of the squared of the points
\end{itemize}
\end{itemize}
 
\vspace{12pt}
 
\section{Spectral Clustering} 
 
The success of spectral clustering is mainly based on the fact that it does not make any assumptions on the form of the clusters. As opposed to k-means, where the resulting clusters are always convex sets, spectral clustering can solve very general problems like intertwined spirals. Moreover, spectral clustering can be implemented efficiently even for large data sets, as long as we make sure that the similarity graph is sparse. Once the similarity graph is chosen, we just have to solve a linear problem, and there are no issues of getting stuck in local minima or restarting the algorithms for several times with different initializations.  
\vspace{12pt}
 
\chapter{Bibliography}
\bigskip \bigskip \bigskip \bigskip \bigskip \bigskip
\begin{itemize}

\item[[ 1]] Diwakar, Manoj, and Manish Maharshi. "An Extraction and Recognition of Tongue-Print Images for Biometrics Authentication System." International Journal of Computer Applications 61.3 (2013).

\item[[ 2]] Ryszard S. Choras. "Tongue Recognition From Images". The first International Conference on Advances in Signal, Image and Video Processing.

\item[[ 3]] Liu, Zhi, et al. "A tongue-print image database for recognition." 2007 International Conference on Machine Learning and Cybernetics. Vol. 4. IEEE, 2007.

\item[[ 4]] K. Phua, J. Chen, T. H. Dat, L. Shue, Heart sound as a biometric, Pattern Recognition, The Journal of the pattern recognition society, Pattern Recognition 41 (2008) 906-919.

\item[[ 5]] J. L. Wayman, A. K. Jain, D. Maltoni, and D. Maio, An introduction to biometric authentication systems," in Biometric Systems: Technology, De-sign and Performance Evaluation, J. L. Wayman, A. K. Jain, D. Maltoni, and D. Maio, Eds.London: Springer-Verlag, 2005, ch. 1, pp. 1-20.

\item[[ 6]] Human Identification using Face and Voice Recognition Ishwar S. Jadhav, V. T. Gaikwad, Gajanan U. Patil International Journal of Computer Science and Information Technologies, Vol. 2 (3) , 2011, 1248-1252.

\item[[ 7]] Hurley DJ, Nixon MS, Carter JN. Force Field Feature Extraction for Ear Biometrics. Computer Vision and Image Understanding. 2005; 98(3): 491-512.

\item[[ 8]] M. Choras, Ear Biometrics Based on Geometric Feature Extraction", Electronic Letters on Computer Vision and Image Analysis 5(3), 84-95, 2005. 35

\item[[ 9]] An Introduction to Biometric Recognition Anil K. Jain, Arun Ross, and Salil Prabhakar, IEEE, vol. 14, no. 1, January 2004.

\item[[ 10]] Iris Biometric Recognition for Person Identification in Security Systems Vanaja Chirchi, Dr. L. M. Waghmare and E. R. Chirchi International Journal of Computer Applications (0975-8887) Volume 24, No.9, June 2011.

\item[[ 11]] Fingerprints, Iris and DNA Features based Multimodal Systems: A Review Prakash Chandra Srivastava, Anupam Agrawal, Kamta Nath Mishra, P. K. Ojha, R. Garg I.J. Information Technology and Computer Science, 2013, 02, 88-111 Published Online January 2013 in MECS. 

\item[[ 12]] H.Y. Wang, J. Zhu, Edge detection based on wavelet transform and its application in porcelain bottles fault monitoring", Automation of Electric Power Systems, vol. 28, 2004, pp. 76-79.

\end{itemize}
\end{document}