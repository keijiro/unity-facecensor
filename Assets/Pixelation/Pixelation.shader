Shader "Hidden/Pixelation" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
            ZTest Always Cull Off ZWrite Off
            Fog { Mode off }

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest

            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;
            uniform sampler2D _SmallTex;

            struct v2f {
                float4 pos : POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata_img v)
            {
                v2f o;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.uv = MultiplyUV (UNITY_MATRIX_TEXTURE0, v.texcoord);
                return o;
            }

            half4 frag (v2f i) : COLOR
            {
                fixed4 main = tex2D(_MainTex, i.uv);
                fixed4 small = tex2D(_SmallTex, i.uv);
                return lerp(main, small, main.w);
            }

            ENDCG
        }
    }
    Fallback off
}
