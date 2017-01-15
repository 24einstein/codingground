sub myfun{
    $totalfiles = scalar(@_);
    foreach $item (@_) #for all the values of files passed to the funxtion myfun
    {
open(fh,"$item");
$count=0;
@currentarr =();
@final=();
while(<fh>)
{
    $count++;
    $arr[$count]=$_;
}
$line=@arr;
@currentarr=();
$curline=$line;
foreach $currentline (@arr)
{ 
    chomp;
    for($offset=0; $offset<=16; $offset++)
        {
            $block=substr($currentline,$offset*4,4);
            $currentarr[$offset+1][$curline-1]=$block;
           
        }
$curline--;
}
#### open files corresponding to each file read from the passed arguments and write the corresponding data
open(fw,">>$item"."out"."."."txt");
#print array in order
for($i=0;$i<=16;$i++)
{
    for($j=0;$j<=$line;$j++)
{
    print(fw "$currentarr[$i][$j]");
}
print(fw "\n");
}
close(fh);
close(fw);
}
}

myfun(file.txt,file1.txt); ## call the subroutine for execution 