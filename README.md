# vhdl-and-fpga-development-for-beginners-and-intermediates
## Generate constraints summary
The .xdc files contain the constraints, but often contain a ton of commented out lines that are difficult to parse. I use this alias to generate a constraints summary to keep track of the important constraints.
```
alias summarizeconstraints='find . | grep xdc | head -1 | xargs -d '"'"'\n'"'"' grep -v "#" | sed '"'"'/^\s*$/d'"'"' > constraints_summary.txt'
```

