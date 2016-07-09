#!/bin/bash
tout=1 #timeout
raiz=$PWD
din=$raiz/in
dout=$raiz/out
#rm -rf $dout
mkdir -p $dout
cd $raiz/tp
for d in *
do
    if [ -d "$d" ] ; then
	echo estudante $d
        mkdir -p $dout/$d
        ddout=$dout/$d/out
        mkdir -p $ddout

    	cd $d
 
        cp nome $raiz/out/$d/
        clog=$dout/$d/comp_log
        elog=$dout/$d/exec_log

        script=$(find -iname \*.sh)
        if [ -z "$script" ]; then
            echo "  sem scripts"
            echo "sem scripts" >> $elog
        else

            for s in $script
            do
                flagCompile=`echo $s|awk '{print match($0,"lar-br")}'`
                flagExecute=`echo $s|awk '{print match($0,"tar-br")}'`
                if [ $flagCompile -gt 0 ] && [ $flagExecute -eq 0 ] ; then
                    comp=$s
                elif [ $flagCompile -eq 0 ] && [ $flagExecute -gt 0 ] ; then
                    exec=$s
                fi
            done 

            atual=$PWD
            if [ `echo $script|awk '{print match($0,"lar-br")}'` -gt 0 ] ; then
                #echo "  "comp bruto em $(dirname "${comp}")       
                cd $(dirname "${comp}")       
                #echo "  "compilando ${comp##*/}
                bash ${comp##*/}  >> $clog
            else
                #echo "  "sem compilacao bruto
                #runnning make just for try
                make &> $clog
            fi
            cd $atual 
            dir=$(dirname "${exec}") 
            echo "  "exec bruto em $dir
 
        	if [ -d "$dir" ] ; then
                cd $dir
            fi
            atual=$PWD
            for i in $din/*
            do
                time=$dout/$d/out/${i#$din/}\.time
                date >> $elog
                prog=${exec##*/}
                input=$i
                output=$dout/$d/out/bruto${i#$din/} 
                #echo "  "executando $prog em $input para $output
                timeout $tout bash $prog $input $output >> $elog 
            done 
            cd $atual




            cd $raiz/tp/$d
            for s in $script
            do
                flagCompile=`echo $s|awk '{print match($0,"lar-di")}'`
                flagExecute=`echo $s|awk '{print match($0,"tar-di")}'`
                if [ $flagCompile -gt 0 ] && [ $flagExecute -eq 0 ] ; then
                    comp=$s
                elif [ $flagCompile -eq 0 ] && [ $flagExecute -gt 0 ] ; then
                    exec=$s
                fi
            done 
            atual=$PWD
            if [ `echo $script|awk '{print match($0,"lar-di")}'` -gt 0 ] ; then
                #echo "  "comp dinamico em $(dirname "${comp}")       
                cd $(dirname "${comp}")       
                #echo "  "compilando ${comp##*/}
                bash ${comp##*/}  >> $clog
            else
                #echo "  "sem compilacao dinamico
                #runnning make just for try
                make &> $clog
            fi
            cd $atual 
            dir=$(dirname "${exec}") 
            echo "  "exec dinamico em $dir
 
        	if [ -d "$dir" ] ; then
                cd $dir
            fi
            atual=$PWD
            for i in $din/*
            do
                time=$dout/$d/out/${i#$din/}\.time
                date >> $elog
                prog=${exec##*/}
                input=$i
                output=$dout/$d/out/dinamico${i#$din/} 
                #echo "  "executando $prog em $input para $output
                timeout $tout bash $prog $input $output >> $elog 
            done 
            cd $atual




            cd $raiz/tp/$d
            for s in $script
            do
                flagCompile=`echo $s|awk '{print match($0,"lar-gu")}'`
                flagExecute=`echo $s|awk '{print match($0,"tar-gu")}'`
                if [ $flagCompile -gt 0 ] && [ $flagExecute -eq 0 ] ; then
                    comp=$s
                elif [ $flagCompile -eq 0 ] && [ $flagExecute -gt 0 ] ; then
                    exec=$s
                fi
            done 
            atual=$PWD
            if [ `echo $script|awk '{print match($0,"lar-gu")}'` -gt 0 ] ; then
                #echo "  "comp guloso em $(dirname "${comp}")       
                cd $(dirname "${comp}")       
                #echo "  "compilando ${comp##*/}
                bash ${comp##*/}  >> $clog
            else
                #echo "  "sem compilacao guloso
                #runnning make just for try
                make &> $clog
            fi
            cd $atual 
            dir=$(dirname "${exec}") 
            echo "  "exec guloso em $dir
 
        	if [ -d "$dir" ] ; then
                cd $dir
            fi
            atual=$PWD
            for i in $din/*
            do
                time=$dout/$d/out/${i#$din/}\.time
                date >> $elog
                prog=${exec##*/}
                input=$i
                output=$dout/$d/out/guloso${i#$din/} 
                #echo "  "executando $prog em $input para $output
                timeout $tout bash $prog $input $output >> $elog 
            done 
            cd $atual


        fi
    fi
    cd $raiz/tp
done
