#!/bin/bash

# <generated_cert_file> <symlink_to_cert> <validity_window_days>
crt_path=$1
crt_sym_path=$2
validity_secs=$(( $3 * 24 * 3600 ))

# 1. the certificate file doesn't exist
if [ ! -f "${crt_path}" ]; then
	exit 1;
fi

# 2. the symlink is not pointing at the certificate file that has to be generated
if [ "`readlink -f ${crt_path}`" != "`readlink -f ${crt_sym_path}`"]; then
	exit 1;
fi

# 3. if the certificate file expiration has entered into the validity window
end_date=`openssl x509 -enddate -noout -in ${crt_path} | cut -f 2 -d \=`
end_ts=`date -u -d "${end_date}" +%s`
now_ts=`date -u +%s`
if [ "$((end_ts - now_ts))" -gt "$validity_secs" ]; then
	exit 1;
fi

exit 0;
