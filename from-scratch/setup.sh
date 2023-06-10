unset PATH;

for p in $baseInputs;
 do
    export PATH=$p/bin${PATH:+:}$PATH
done