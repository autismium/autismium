if [ pwd == */scripts ];
then
    cd ..
fi
echo "=== Applying ROOT patches ==="
for patch in patches/root/*; do
    echo "Applying $patch"
    git apply $patch --directory=src
done

echo "=== Applying SUBMODULE patches ==="
for patch in patches/submodules/third_party/search_engines_data/resources/*; do
    echo "Applying $patch"
    git apply $patch --directory=src
done

echo "=== ALL PATCHES ATTEMPTED ==="
