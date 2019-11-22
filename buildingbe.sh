echo "on se place dans le bon répertoire " ;
cd ~/android/lineage/ ;
echo "source profile... "
source ~/.profile ;
echo "synchro du repo "
repo sync ;
echo "chargement des variables "
source build/envsetup.sh ;
echo "Petit dej "
breakfast mido ;
echo "succès, génération de la rom... "
croot ;
brunch mido ;
echo "JayJay bro"
cd $OUT ;
