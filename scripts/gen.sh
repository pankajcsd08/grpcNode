argc=$#
argv=("$@")

for (( j = 0; j < argc; ++j )); do

  grpc_tools_node_protoc -I ${argv[j]}/proto/                                   \
    --js_out=import_style=commonjs:${argv[j]}/proto/                            \
    --grpc_out=grpc_js:${argv[j]}/proto/                                        \
    ${argv[j]}/proto/${argv[j]}.proto;
  

  grpc_tools_node_protoc -I ${argv[j]}/proto/                                   \
    --js_out=import_style=commonjs:${argv[j]}/proto/                            \
    $(find ${argv[j]}/proto/ -type f -name "*.proto" -not -path "${argv[j]}/proto/${argv[j]}.proto")
done