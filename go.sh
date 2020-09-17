#!/bin/sh

name=`basename $0 .sh`
case $1 in
 d|deploy)
        echo "start..."
        hexo clean && hexo generate && hexo deploy
        ;;
 init)
        echo "install hexo ..."
        npm install hexo --registry=https://registry.npm.taobao.org
        ;;
 save)
        echo "push hexo to github ..."
        git push -u origin hexo
        ;;
 *)
        echo "Usage: $name [deploy|init|save]"
        echo "\tdeploy: update github pages"
        echo "\tinit install hexo"
        echo "\tpush source files to github"
        exit 1
        ;;
esac

exit 0
