alias x='chmod a+x $_; $_'
alias open='open_command'

export PATH=$PATH:'.'

if [ `uname` = 'Linux' ]
then
    alias rm='mv --backup=t -t /tmp '
fi

