% UC letterhead class
% $Log: ucletter.cls,v $
%
% Revision 1.6  2016/12/14 tad
% added Davis as the default and included more departments. 
% edit easily to add more departments to suit needs. 
%
% Revision 1.5  2003/07/25 20:31:42  elm
% Major changes to ucletter.cls to make it look more like the standard
% UC letterhead.
%
% Added a class for doing biobibs.
%
% Revision 1.4  2003/05/11 18:04:19  elm
% Changed size of subcaption figures.
%
% Revision 1.3  2002/12/17 00:01:26  elm
% Minor formatting changes for UC letterhead.
%
% Revision 1.2  2002/12/09 19:15:30  elm
% Made changes including the use of "noaddress" to omit the
% return address.
%
% Revision 1.1  2002/06/07 21:58:38  elm
% This class is for printing letters on UC letterhead.  It's similar to
% the old ucletter style, but is updated to use LaTeX2e stuff.
%
%
% Use the letterhead in the following way:
%
% \documentclass[davis,esp,shortfrom,11pt]{ucletter}
%
% \telephone{+1 (831) 459-1222}
% \email{yourEmail@ucdavis.edu}
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucletter}

\RequirePackage{ifthen}
\RequirePackage{graphics}
\RequirePackage{mathptm}
\RequirePackage{times}

% Default is short return address
\newcommand{\ucl@fromaddr}{short}


% Defaults are for UC-Davis Environmental Science and Policy
\newcommand{\ucl@univ}{Davis}
\newcommand{\ucl@campus}{Davis}
\newcommand{\ucl@school}{Environmental Science and Policy}
\newcommand{\ucl@univstreet}{One Shields Ave}
\newcommand{\ucl@univtown}{Davis, California 95616}
\newcommand{\ucl@dept}{Environmental Science and Policy}
\newcommand{\ucl@deptphone}{}
\newcommand{\ucl@deptfax}{}
\newcommand{\ucl@depturl}{}
\newcommand{\ucl@telephone}{}
\newcommand{\ucl@email}{}
\newcommand{\ucl@fax}{}
\newcommand{\dept}[1]{\renewcommand{\ucl@dept}{#1}}
\newboolean{ucl@firstfooter}
\setboolean{ucl@firstfooter}{false}
\newboolean{ucl@otherfooter}
\setboolean{ucl@otherfooter}{false}
\newcommand{\ucl@pagetitle}{}


% These commands show up in the return address, but NOT in the footer on each page
\newcommand{\email}[1]{\renewcommand{\ucl@email}{#1}}
\newcommand{\fax}[1]{\renewcommand{\ucl@fax}{#1}}




% Davis
\DeclareOption{davis}{
  \renewcommand{\ucl@univ}{UC-Davis}
  \renewcommand{\ucl@campus}{Davis}
  \renewcommand{\ucl@school}{Environmental Science and Policy}
  \DeclareOption{esp}{
    \renewcommand{\ucl@dept}{Environmental Science and Policy}
    \renewcommand{\ucl@deptphone}{}
    \renewcommand{\ucl@deptfax}{}
    \renewcommand{\ucl@depturl}{http://desp.ucdavis.edu/}
    \renewcommand{\ucl@univstreet}{One Shields Ave}
    \renewcommand{\ucl@univtown}{Davis, California 95616}
  }
  \DeclareOption{ecol}{
    \renewcommand{\ucl@dept}{Ecology and Evolutionary Biology}
    \renewcommand{\ucl@deptphone}{}
    \renewcommand{\ucl@deptfax}{}
    \renewcommand{\ucl@depturl}{}
    \renewcommand{\ucl@univstreet}{One Shields Ave}
    \renewcommand{\ucl@univtown}{Davis, California 95616}
  }
}



% Berkeley
\DeclareOption{berkeley}{
  \renewcommand{\ucl@univ}{UC-Berkeley}
  \renewcommand{\ucl@campus}{Berkeley}
  \renewcommand{\ucl@school}{College of Natural Resources}
  \DeclareOption{espm}{
    \renewcommand{\ucl@dept}{ Environmental Science, Policy, \& Management }
    \renewcommand{\ucl@deptphone}{}
    \renewcommand{\ucl@deptfax}{}
    \renewcommand{\ucl@univstreet}{Mulford Hall}
    \renewcommand{\ucl@univtown}{Berkeley, California 95616}
  }
}




% Santa Cruz
\DeclareOption{ucsc}{
  \renewcommand{\ucl@univ}{UCSC}
  \renewcommand{\ucl@campus}{Santa Cruz}
  \renewcommand{\ucl@depturl}{http://www.soe.ucsc.edu/}
  \renewcommand{\ucl@univstreet}{Baskin Engineering Building}
  \renewcommand{\ucl@univtown}{Santa Cruz, California 95064}
  \DeclareOption{soe}{
    \dept{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptphone}{+1 (831) 459-2158}
    \renewcommand{\ucl@school}{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptfax}{+1 (831) 459-4829}
    \renewcommand{\ucl@depturl}{http://www.soe.ucsc.edu/}
  }
  \DeclareOption{cs}{
    \dept{Computer Science Department}
    \renewcommand{\ucl@deptphone}{+1 (831) 459-5745}
    \renewcommand{\ucl@school}{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptfax}{+1 (831) 459-4829}
    \renewcommand{\ucl@depturl}{http://www.cs.ucsc.edu/}
  }
  \DeclareOption{ce}{
    \dept{Computer Engineering Department}
    \renewcommand{\ucl@school}{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptphone}{+1 (831) 459-5745}
    \renewcommand{\ucl@deptfax}{+1 (831) 459-4829}
    \renewcommand{\ucl@depturl}{http://www.ce.ucsc.edu/}
  }
  \DeclareOption{ee}{
    \dept{Electrical Engineering Department}
    \renewcommand{\ucl@school}{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptphone}{+1 (831) 459-5745}
    \renewcommand{\ucl@deptfax}{+1 (831) 459-4829}
    \renewcommand{\ucl@depturl}{http://www.ee.ucsc.edu/}
  }
  \DeclareOption{ams}{
    \dept{Applied Mathematics \& Statistics}
    \renewcommand{\ucl@school}{Jack Baskin School of Engineering}
    \renewcommand{\ucl@deptphone}{+1 (831) 459-4822}
    \renewcommand{\ucl@deptfax}{+1 (831) 459-4829}
    \renewcommand{\ucl@depturl}{http://www.ams.ucsc.edu/}
  }
}






% Santa Barbara
\DeclareOption{ucsb}{
  \renewcommand{\ucl@univ}{UCSB}
  \renewcommand{\ucl@campus}{Santa Barbara}
  \renewcommand{\ucl@school}{}
  \DeclareOption{cs}{
    \renewcommand{\ucl@dept}{Department of Computer Science}
    \renewcommand{\ucl@deptphone}{}
    \renewcommand{\ucl@deptfax}{}
    \renewcommand{\ucl@depturl}{http://www.cs.ucsb.edu/}
    \renewcommand{\ucl@univstreet}{}
    \renewcommand{\ucl@univtown}{Santa Barbara, California 93106-5110}
  }
}




% Irvine
\DeclareOption{uci}{
  \renewcommand{\ucl@univ}{UCI}
  \renewcommand{\ucl@campus}{Irvine}
  \renewcommand{\ucl@school}{Henri Samueli School of Engineering}
  \DeclareOption{eecs}{
    \renewcommand{\ucl@dept}{Department of Electrical Engineering and Computer Science}
    \renewcommand{\ucl@deptphone}{949-824-4821}
    \renewcommand{\ucl@deptfax}{}
    \renewcommand{\ucl@depturl}{http://www.eng.uci.edu/}
    \renewcommand{\ucl@univstreet}{325 Engineering Tower}
    \renewcommand{\ucl@univtown}{Irvine, California 92697-2625}
  }
}








\DeclareOption{nofrom}{
  \renewcommand{\ucl@fromaddr}{none}
}

\DeclareOption{shortfrom}{
  \renewcommand{\ucl@fromaddr}{short}
}

\DeclareOption{fullfrom}{
  \renewcommand{\ucl@fromaddr}{full}
}

\DeclareOption{datefrom}{
  \renewcommand{\ucl@fromaddr}{date}
}

\DeclareOption{noaddrfooter}{
  \setboolean{ucl@firstfooter}{false}
  \setboolean{ucl@otherfooter}{false}
}

\DeclareOption{addrfooterall}{
  \setboolean{ucl@firstfooter}{true}
  \setboolean{ucl@otherfooter}{true}
}

\DeclareOption{addrfooter}{
  \setboolean{ucl@firstfooter}{false}
  \setboolean{ucl@otherfooter}{true}
}
  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions

\LoadClass{letter}
\RequirePackage{fullpage}

\renewcommand{\telephone}[1]{\renewcommand{\ucl@telephone}{#1}}
\newcommand{\@sixrm}{\fontfamily{ptm}\fontsize{6}{8}\selectfont}
\newcommand{\@svnrm}{\fontfamily{ptm}\fontsize{7}{9}\selectfont}
\newcommand{\@egtrm}{\fontfamily{ptm}\fontsize{8}{10}\selectfont}
\newcommand{\@twlrm}{\fontfamily{ptm}\fontsize{12}{14}\selectfont}
\newcommand{\@ctrdot}{\hspace*{1.4pt}$\cdot$\hspace*{1.4pt}}

% Build the UC letterhead
\newsavebox{\@ucletterhead}
\sbox{\@ucletterhead}{\parbox[b]{7in}{
    \begin{tabular*}{7in}{@{}l@{\extracolsep\fill}r@{}}
      \@twlrm\selectfont UNIVERSITY OF CALIFORNIA, {\MakeUppercase \ucl@campus} &
    \end{tabular*}\\
    \begin{tabular*}{7in}{@{}l@{}c@{}r@{}}
      \parbox{4.60in}{\rule{4.55in}{0.25pt} \\
        \@svnrm BERKELEY\@ctrdot DAVIS\@ctrdot IRVINE\@ctrdot
        LOS ANGELES\@ctrdot MERCED\@ctrdot RIVERSIDE\@ctrdot
        SAN DIEGO\@ctrdot SAN FRANCISCO\hspace\fill \\
        \rule[3pt]{4.55in}{0.25pt}} &
      \parbox{0.75in}{\resizebox{0.75in}{!}{\includegraphics{ucsealnew}}}
      \parbox{1.6in}{\rule{1.6in}{0.25pt} \\
        \rule{0mm}{4pt}\hspace\fill
        \@svnrm SANTA BARBARA\@ctrdot SANTA CRUZ\hspace*{1pt} \\
        \rule[3pt]{1.6in}{0.25pt}}
    \end{tabular*}
    \vspace*{24pt}
    \begin{minipage}{7in}
      \@egtrm\MakeUppercase
      \ucl@dept
      \ifthenelse{\equal{\ucl@deptphone}{}}{}{\hspace\fill\ucl@deptphone} \\
      \ifthenelse{\equal{\ucl@univstreet\ucl@deptfax}{}}{}{
	\@egtrm\MakeUppercase \ucl@univstreet
	\ifthenelse{\equal{\ucl@deptfax}{}}{}{ \hspace\fill FAX~\ucl@deptfax}
	\\
      }
      \@egtrm\MakeUppercase \ucl@univtown \\
    \end{minipage}
  }
}

\newcommand{\@ucaddress}{
  \begin{minipage}[t]{2.2in}
    \ifthenelse{\equal{\ucl@fromaddr}{full}}{
      \ifthenelse{\equal{\ucl@dept}{}}{}{\ucl@dept\\}
      \ucl@school \\
      University of California \\
      \ifthenelse{\equal{\ucl@univstreet}{}}{}{\ucl@univstreet\\}
      \ucl@univtown \\
    }
    {}
    \ifthenelse{\equal{\ucl@fromaddr}{date}}{}{
      \ifthenelse{\equal{\ucl@telephone}{}}{}{{\sc Phone:} \ucl@telephone\\}
      \ifthenelse{\equal{\ucl@fax}{}}{}{{\sc Fax:} \ucl@fax\\}
      \ifthenelse{\equal{\ucl@email}{}}{}{{\sc Email:} \ucl@email\\}
    }
    \@date
  \end{minipage}
}

% Dot with spacing around it
\newcommand{\@spcdot}{\hspace{7pt}$\cdot$\hspace{7pt}}
% The argument is for a page number, in case you want to print the
% page number at the bottom of the page
\newcommand{\@addrfoot}[1]{
  % return address in 9 point font
  \begin{tabular}{c}
    \fontfamily{ptm}\fontsize{8}{10}\selectfont
    \sc \ucl@dept\@spcdot\ucl@univstreet\@spcdot\ucl@univtown \\
    \fontfamily{ptm}\fontsize{8}{10}\selectfont
    \sc Phone: \ucl@deptphone{\@spcdot}Fax: \ucl@deptfax\@spcdot\ucl@depturl
  \end{tabular}
}

\newcommand{\pagetitle}[1]{\renewcommand{\ucl@pagetitle}{#1}}

\setlength{\topmargin}{-0.5in}
\setlength{\footskip}{0.5in}
\setlength{\textwidth}{7in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}


\newlength{\@ucaddrht}
\renewcommand{\ps@firstpage}
{
  \setlength{\headheight}{0.9in}
  \setlength{\headsep}{0.10in}
  \setlength{\textheight}{8.5in}
  \renewcommand{\@oddhead}{\centerline{\parbox{7in}{\usebox{\@ucletterhead}}}}
  \renewcommand{\@evenhead}{}
  % Use a blank for the page number - no number on the first page of the letter
  \renewcommand{\@oddfoot}{\ifthenelse{\boolean{ucl@firstfooter}}{\@addrfoot{~}}{}}
  \renewcommand{\@evenfoot}{\@oddfoot}
}

\renewcommand{\ps@headings}{
  \setlength{\headheight}{0.25in}
  \setlength{\headsep}{0.25in}
  \setlength{\textheight}{9in}
  % Right justify the page number
  \renewcommand{\@oddhead}{\hspace*{\fill}\ucl@pagetitle\hspace*{\fill}\thepage}
  \renewcommand{\@evenhead}{\@oddhead}
  % Pass the page number to the footer, which doesn't do anything currently
  \renewcommand{\@oddfoot}{\ifthenelse{\boolean{ucl@otherfooter}}{\@addrfoot{\thepage}}{}}
  \renewcommand{\@evenfoot}{\@oddfoot}
}

\pagestyle{headings}

\renewcommand{\opening}[1]{
  \thispagestyle{firstpage}
  \vspace*{0.25in}
  \ifthenelse{\equal{\ucl@fromaddr}{none}}{}{
    \noindent\rule{4.25in}{0mm}
    \@ucaddress
  }
  \par\noindent\toname \\ \toaddress

  \vspace{1ex}

  \noindent #1
}
