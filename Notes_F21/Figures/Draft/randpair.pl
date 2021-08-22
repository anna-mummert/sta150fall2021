$xmax = 10;
$ymax = 7;

$xshift = 0.5;
$yshift = 0.5;

$mindist = 0.5;

$points = 50;


#############################################

sub dist { 
  my $xa = shift;
  my $ya = shift;
  my $xb = shift;
  my $yb = shift;
  
  my $dist = ($xa - $xb)*($xa - $xb) + ($ya-$yb)*($ya - $yb);
  $dist = sqrt($dist);

  return $dist;
}


#############################################
$i = 0;
while ( $i < $points ) { 
  $x = $xmax * rand();
  $x = sprintf("%1.2f", $xshift+$x);

  $y = $ymax * rand();
  $y = sprintf("%1.2f", $yshift+$y);

  $ok = 1;
  for ( $j = 0; $j < $i; $j++ ) { 
    if ( dist($x, $y, $xs[$j], $ys[$j]) < $mindist ) { 
      $ok= 0;
    }
  }
 
  if ( $ok ) { 
    push @xs, $x;
    push @ys, $y;
    push @d, "$x / $y";
    $i++;
  }
}



for ( $i = 0; $i <$points; $i++ ) { 
  if ( 0 == ($i % 10 ) ) { print "\n"; }
  print $d[$i] . ", ";
}
print "\n";
