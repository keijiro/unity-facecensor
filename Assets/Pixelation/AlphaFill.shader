Shader "Custom/Alpha Fill" {
    Properties {
        _Color ("Alpha", Color) = (1, 1, 1, 1)
    }
    SubShader {
        Pass {
            ZTest Always Cull Off ZWrite Off
            Fog { Mode off }
            ColorMask A

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            uniform fixed4 _Color;

            struct v2f {
                float4 pos : POSITION;
            };

            v2f vert(appdata_img v)
            {
                v2f o;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }

            half4 frag (v2f i) : COLOR
            {
                return _Color;
            }

            ENDCG
        }
    }
    Fallback off
}
