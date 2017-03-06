#!/usr/bin/perl 
# lineIndexMaker v0.0.0
#
# This perl script reads a vcf file
# and prints a report of of the starting and ending line given a window size.
# Only lines conforming to the regular expression ^[0-9] will be considered (to skip vcf headers)
# and line numbers returned are not considering the headers so line one is actually first line after end of headers.
# This script is disregarding the chromsome number because it is assuming the VCF provided correspond to just on chromosome
# and sites within that chromosme are ordered by physical position.
# Made by Luis M. Avila (lmavila@gmail.com) 
#
# usage: line_index_maker -i <inputFilename> -s <window_size> -o <outputFileName> -v (for verbose output)
#####
# reading parameters ##########################################
   use strict;
   use warnings;
   use POSIX;
   
   my $numArgs;
   my $verbose;
   my $i;
   my $counter;
   my $input_file;
   my $line_counter;
   my $window_line_start;
   my $window_threshold;
   my $window_counter;
   my $window_size; #in base pairs 1000 for 1kb
   my $length;
   my @elements;
  
   #Hardcoded limits

   $numArgs = $#ARGV + 1;
   $verbose=0;
   $input_file='';
   for ($i=0; $i < $numArgs-1; $i++)
   {  
       if ($ARGV[$i] eq "-i") { $input_file = $ARGV[$i+1];  } ;  
       if ($ARGV[$i] eq "-s") { $window_size = $ARGV[$i+1];  } ;  
       #if ($ARGV[$i] eq "-v") { $verbose = 1;  } ;  

   } 

  if (defined $ARGV[$numArgs-1])
  {
      if ($ARGV[$numArgs-1] eq "-v") { 
         $verbose=1;
        }   ;
   }

   if(!$input_file | !$window_size) 
     {
        print "lineIndexMaker v0.0.0
        \nusage: line_index_maker -i <inputFilename> -s <window_size> -o <outputFileName> -v (for verbose output) \n";
        die "\n";  
 }

#calculating the lines of the windows  ###############################################
   #opening the files
    open(MYFILE,$input_file) || die "Can't Open $input_file: $!\n";
    

   #initializing accumulators 
   $line_counter=0;
   $window_counter=0;
   $window_threshold=0;
   $window_line_start=1;
 
   $counter=0;
   if($verbose) {print"num_window\tstart\tend\n";}
   while(<MYFILE>) 
   { 
       chomp;
       if ($_=~m/^[0-9]/)
       { 
           $counter++;
           $line_counter++; 
           @elements=split(/\t/,$_);
           if($window_threshold==0){
             $window_threshold=(POSIX::floor($elements[1]/$window_size)+1)*$window_size;
           }

   
           if ($elements[1]>$window_threshold){
               $window_counter++;
               print "$window_counter\t$window_line_start\t$line_counter\n";
               $window_threshold=$window_threshold+$window_size;
               $window_line_start=$line_counter+1;
                
           }

        }

   }


############### end of script

