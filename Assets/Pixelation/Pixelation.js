#pragma strict

@script ExecuteInEditMode
@script RequireComponent(Camera)
@script AddComponentMenu("Image Effects/Pixelation")

class Pixelation extends PostEffectsBase {
    @HideInInspector var shader : Shader;

    var scale = 8;

    private var material : Material;

    function CheckResources() {
        material = CheckShaderAndCreateMaterial(shader, material);
        return CheckSupport();
    }

    function OnRenderImage(source : RenderTexture, destination : RenderTexture) {
        if (!CheckResources()) {
            ReportAutoDisable();
            Graphics.Blit(source, destination);
            return;
        }

        var small = RenderTexture.GetTemporary(source.width / scale, source.height / scale, 0);

        Graphics.Blit(source, small);

        small.filterMode = FilterMode.Point;

        material.SetTexture("_SmallTex", small);
        Graphics.Blit(source, destination, material, 0);
        
        RenderTexture.ReleaseTemporary(small);           
    }
}
