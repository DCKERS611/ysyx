
module \$_DLATCH_N_ (E, D, Q);
  input E, D;
  output Q;
  LATLX1H7L _TECHMAP_REPLACE_ (.D(D), .GN(E), .Q(Q));
endmodule

module \$_DLATCH_P_ (E, D, Q);
  input E, D;
  output Q;
  LATHX1H7L _TECHMAP_REPLACE_ (.D(D), .G(E), .Q(Q));
endmodule

