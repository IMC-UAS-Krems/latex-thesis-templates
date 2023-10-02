\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imc-inf}[2023/09/09 IMC Informatics Bachelor Thesis Template]

\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}

\definecolor{imcgray}{RGB}{118,134,146}

\RequirePackage{xcolor}
\definecolor{imcblue}{RGB}{96,142,228}
\definecolor{imctech}{RGB}{249,72,104}
\definecolor{imcorange}{RGB}{255,158,27}
\RequirePackage{etoolbox}
\PassOptionsToClass{twoside}{book}
\PassOptionsToClass{11pt}{book}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions
\LoadClass{book}

% change style of chapter header 
\RequirePackage{titlesec}
%% \titleformat takes the following form:
% \titleformat{\chapter}[display] % Shape
%   {} % Format
%   {} % Label
%   {} % Sep
%   {} % Before
%   [] % After
\titleformat{\chapter}[display]
  { \normalsize \huge \color{imcgray}}
  { %
    \color{imcorange}{\chaptertitlename} %
    {\fontsize{120}{80}\color{imcorange}\selectfont\thechapter} %
  }
  {0pt} %
  {\normalfont\scshape\Huge} %
  [] %

%   FONTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

%   MARGINS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}[2010/09/12]
 \newgeometry{
        top=1in,
        left=1.25in,
        bottom=0.7in,
        right=1.25in,
        includefoot   % ensure page numbers do not extend into margins
    }

%   LINE SPACING  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\newcommand{\defaultspacing}{\onehalfspacing} % (1)
\newcommand{\smallspacing}{\setstretch{\setspace@singlespace}}  % (2)
\renewcommand{\backmatter}{%
  \renewcommand{\defaultspacing}{\smallspacing}%
  \clearpage%
}
\defaultspacing
% Use a single word space between sentences. If you disable this, you will have to manually control spacing around abbreviations.
\frenchspacing      

\pretocmd{\@chapter}{\smallspacing}{}{}
\apptocmd{\@chapter}{\defaultspacing}{}{}

\pretocmd{\@schapter}{\smallspacing}{}{}
\apptocmd{\@schapter}{\defaultspacing}{}{}

\pretocmd{\@sect}{\smallspacing}{}{}
\apptocmd{\@sect}{\defaultspacing}{}{}

\pretocmd{\@ssect}{\smallspacing}{}{}
\apptocmd{\@ssect}{\defaultspacing}{}{}


%   FOOTNOTES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\footnoterule{\relax}
\setlength{\skip\footins}{\baselineskip}
\setlength{\footnotesep}{\baselineskip}

%   PAGINATION  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{plain}

\apptocmd{\frontmatter}{%
    \pagenumbering{roman}
}

\apptocmd{\mainmatter}{%
    \pagenumbering{arabic}
}


%   WIDOWS AND ORPHANS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[all]{nowidow}


%   TITLE PAGE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{{%
    \thispagestyle{empty}
				\null\vfill
          \begin{center}
               {\Huge\bfseries{\@title}} \\                 
               \vspace{1em}
               {\large\bfseries\@subtitle}       \\       
               \vspace{1em}               
               \vfill
              \textcolor{imcorange} {\Large\bfseries\@thesistype} \\
			   \vspace{1em}
			   {\large\bfseries\
			  \textit{ Submitted to} \\
			   IMC University of Applied Sciences Krems\\
                     
			   }
			   \vspace{2em}
			   \includegraphics[width=1\textwidth]{imc.png}\\
			   \vspace{2em}		   
                \textcolor{imcorange}{\large\bfseries\ Bachelor Programme Informatics}\\
               \vspace{2em}
               {\large\bfseries\ by}\\                                
               \vspace{1em}
               \textcolor{imcgray}{\Huge\bfseries\@author}
               \\
               \vspace{1em}
               \vfill
               {\large\bfseries\ for the award of academic degree}\\
               {\Large\bfseries\ Bachelor of Science in Engineering (BSc)}\\
               \vspace{2em}
               {\large\bfseries\ under the supervision of}\\
               {\Large\bfseries\@supervisor}\\
            
		    \vfill
		    \textcolor{imcgray}{\bfseries\ Submitted on \@submissiondate}\\
		 \end{center}   
    \newpage
}}


\newcommand{\@thesistype}{THESIS \@MissingMetadata{thesistype}}
\newcommand{\@subtitle}{SUBTITLE \@MissingMetadata{subtitle}}
\newcommand{\@supervisor}{SUPERVISOR \@MissingMetadata{supervisor}}
\newcommand{\@degree}{DEGREE \@MissingMetadata{degree}}
\newcommand{\@department}{DEPARTMENT \@MissingMetadata{department}}
\newcommand{\@faculty}{FACULTY \@MissingMetadata{faculty}}
\newcommand{\@submissiondate}{SUBMISSION DATE \@MissingMetadata{submissiondate}}
\newcommand{\@copyrightyear}{YEAR \@MissingMetadata{copyrightyear}}

\newcommand{\@MissingMetadata}[1]{\ClassWarning{imc-inf}{%
    Missing #1. Set this in the preamble to fix your frontmatter.
}}


\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\thesistype}[1]{\renewcommand{\@thesistype}{#1}}
\newcommand{\submissiondate}[1]{\renewcommand{\@submissiondate}{#1}}
\newcommand{\copyrightyear}[1]{\renewcommand{\@copyrightyear}{#1}}
\newcommand{\copyrightnotice}[1]{%
    \renewcommand{\@copyrightnotice}{%
        \begin{minipage}{\dimexpr\textwidth-1in\relax}
            \small\centering
            #1
        \end{minipage}
    }
}




%   ABSTRACT AND KEYWORDS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@keywords}{KEYWORDS \@MissingMetadata{keywords}}

\newenvironment{abstract}{%
    \addtoToC{Abstract}%
    \chapter*{Abstract}%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{5pt}%
}{%
    \leavevmode\\[5pt]
    \noindent\textbf{Keywords:} \@keywords
    \newpage
}


%   TABLE OF CONTENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}
\renewcommand{\contentsname}{Table of Contents}

\newcommand{\addtoToC}[1]{\addcontentsline{toc}{chapter}{#1}}

\renewcommand{\cfttabpresnum}{Table\ }
\renewcommand{\cfttabnumwidth}{0.75in}
\renewcommand{\cftfigpresnum}{Figure\ }
\renewcommand{\cftfignumwidth}{0.90in}


%   DEDICATION AND ACKNOWLEDGEMENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{declarations}{%
   
    
    \chapter*{Declaration of honour}
    \addtoToC{Declaration of honour}

    
    
    I declare on my word of honour that I have written this \@thesistype~ on my own and that I have not used any sources or resources other than stated and that I have marked those passages and/or ideas that were either verbally or textually extracted from sources. This also applies to drawings, sketches, graphic representations as well as to sources from the internet. The \@thesistype~ has not been submitted in this or similar form for assessment at any other domestic or foreign post-secondary educational institution and has not been published elsewhere. The present \@thesistype~ complies with the version submitted electronically.
    
    \vspace{5em}
    
    \begin{tabular}{@{}p{.5in}p{4in}@{}}
    	& \hrulefill \\
    	& \@author \\
    	& \@submissiondate\\
    \end{tabular}
    
    
%    \chapter*{Ehrenwörtliche Erklärung}
%    \addtoToC{Ehrenwörtliche Erklärung}
    
    
%    „Ich erkläre ehrenwörtlich, dass ich die vorliegende Arbeit selbständig und ohne fremde Hilfe verfasst, andere als die angegebenen Quellen nicht benutzt und die den Quellen wörtlich oder inhaltlich entnommenen Stellen und/oder Gedanken als solche kenntlich gemacht habe. Dies gilt auch für Zeichnungen, Skizzen, bildliche Darstellungen sowie für Quellen aus dem Internet. 
%    Die Arbeit wurde bisher in gleicher oder ähnlicher Form an keiner anderen inländischen oder ausländischen Institution zur Beurteilung vorgelegt und auch noch nicht veröffentlicht. Die vorliegende Fassung entspricht der eingereichten elektronischen Version.“
    
    
%    Datum: TT MM JJJJ							Unterschrift
    
    
    }{\newpage}


\newenvironment{acknowledgements}{%
    \chapter*{Acknowledgements}
    \addtoToC{Acknowledgements}
    }{\newpage}



%   APPENDICES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\BeforeBeginEnvironment{appendices}{
    \parskip=0.5\baselineskip \advance\parskip by 0pt plus 2pt
    \parindent=\z@
}


%   HYPERREF SETUP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref} 
\hypersetup{
	colorlinks = true,
	linkcolor = imcblue,
	anchorcolor = imcblue,
	citecolor = imctech,
	filecolor = imcblue,
	urlcolor = imcblue
}

\AtBeginDocument{%
    \@ifpackageloaded{hyperref}{%
        \pretocmd{\addtoToC}{\phantomsection{}}{}{}
        \newcommand{\Appendixautorefname}{Appendix}
    }{}
}

\endinput
