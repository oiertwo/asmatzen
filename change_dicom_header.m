% Creas una carpeta y metes dentro este script. En esa misma carpeta creas
% una carpeta que se llame "data" por ejemplo y metes ahi las carpetas que quede tal que
% ~/data/00000000/todoslosdicoms
 
sep = '/';
dirOr = 'data';
dirDes = 'converted';
iniFi = 3;
% Buscar un dicom de ejemplo y asignar su ruta a continuacion
exampleDicomInfoDir = '/lugar/en/el/sistema/dicom_de_ejemplo.dcm';
 
actDir = pwd;
rutaDestino = [actDir, sep, dirDes, sep];
actDir = [actDir, sep, dirOr, sep];
lst = dir(actDir);
 
for i = iniFi:length(lst)
compDir = [actDir, lst(i).name, sep];
rutDest = [rutaDestino, lst(i).name, sep];
 
if exist(rutDest,'dir') == 0
mkdir(rutDest)
end
 
inDir = dir(compDir);
for j = iniFi: length(inDir)
rutaIn = [compDir, inDir(j).name];
 
Dread=dicomread(rutaIn);
% We save DICOM files.
slice = j-2;
if (slice<10)
indice=['00',num2str(slice)];
elseif (slice<100)
indice=['0',num2str(slice)];
else
indice=num2str(slice);
end
 
rutaSave = [rutDest, indice, '.dcm'];
info = dicominfo(exampleDicomInfoDir);
info.InstanceNumber = slice;
dicomwrite(Dread, rutaSave, info);
end
end
