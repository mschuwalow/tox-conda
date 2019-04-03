self: super: 
{
  conda = super.conda.overrideAttrs (oldAttrs: {
    SOURCE_DATE_EPOCH=315532800;
    LC_ALL="C.UTF-8";
  });
}
