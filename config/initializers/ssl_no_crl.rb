require "openssl"

store = OpenSSL::X509::Store.new
store.set_default_paths
# ※ flags は設定しない = CRL チェックを強制しない

params = OpenSSL::SSL::SSLContext::DEFAULT_PARAMS
params[:cert_store]  = store
params[:verify_mode] = OpenSSL::SSL::VERIFY_PEER
# 念のため verify_flags があれば 0 を明示
params[:verify_flags] = 0 if params.key?(:verify_flags)