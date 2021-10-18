function dogx
  set ip (flipip $argv[1])
  if [ $status = 0 ];
    dog PTR $ip
  end
end
