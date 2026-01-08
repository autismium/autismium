if [ pwd == */scripts ];
then
    cd ..
fi
echo "=== Reverting ROOT patches ==="
for patch in patches/root/*; do
    echo "Reverting $patch"
    git apply -R $patch --directory=src
done

echo "=== Reverting SUBMODULE patches ==="
for patch in patches/submodules/third_party/search_engines_data/resources/*; do
    echo "Reverting $patch"
    git apply -R $patch --directory=src
done

echo "=== ALL PATCHES ATTEMPTED ==="
