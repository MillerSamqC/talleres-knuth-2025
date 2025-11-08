# app_html_example.py
from dash import Dash, html

app = Dash(__name__)

app.layout = html.Div(
    children=[
        html.H1("Ejemplo de Dash HTML Components", style={"color": "darkblue"}),
        html.P("Cada componente Python se traduce a un elemento HTML real."),
        html.Div(
            [
                html.H2("Lista generada con HTML Components"),
                html.Ul(
                    [
                        html.Li("Elemento 1"),
                        html.Li("Elemento 2"),
                        html.Li("Elemento 3"),
                    ]
                ),
            ],
            style={
                "border": "2px solid #0074D9",
                "borderRadius": "8px",
                "padding": "10px",
                "backgroundColor": "#F0F8FF",
                "width": "50%",
            },
        ),
        html.Br(),
        html.A("Visita Dash Docs", href="https://dash.plotly.com/", target="_blank"),
        html.Footer("© 2025 Ejemplo educativo de Dash", style={"marginTop": "30px"})
    ]
)

if __name__ == "__main__":
    app.run(debug=True)
