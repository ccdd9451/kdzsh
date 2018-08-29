alias x='chmod a+x $_; $_'
alias open='open_command'
function clearls {
  if [[ `pwd` -ef $HOME ]]; then
    ls -IDesktop -IDocuments -IDownloads -IMusic -IPictures\
       -IPublic -ITemplates -IVideos -Isnap --color=tty;
  else
    ls --color=tty;
  fi
}
alias ls=clearls
alias la="\ls --color=tty -lAh"
export PATH=$PATH:'.'

if [ `uname` = 'Linux' ]
then
    alias rm='mv --backup=t -t /tmp '
fi

