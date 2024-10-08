from multiprocessing import AuthenticationError
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
#parte del formulario 
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login, authenticate
#librerias para servidor smtp y exchange
from datetime import datetime, timedelta

#renderizacion de todas las paginas
def home(request):
    return render(request, 'core/home.html')

def creaciondeticket(request):
    return render(request, 'core/creaciondeticket.html')

def configuracion(request):
    return render(request, 'core/configuracion.html')

def creaciondeticket(request):
    return render(request, 'core/creaciondeticket.html')

def ticketscerrados(request):
    return render(request, 'core/ticketscerrados.html')

def configuraciondecorreo(request):     
    return render(request, 'core/configuraciondecorreo.html')

@login_required
def products(request):
    return render(request, 'core/products.html')

#parte del formulario 
def exit(request):
    logout(request)
    return redirect('home')

def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')  # Cambia 'home' por la URL de la página a la que deseas redirigir al usuario después del registro
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

#para devolver error si ingresa mal usuario y contraseña 
def login_view(request):
    if request.method == 'POST':
        form = AuthenticationError(data=request.POST)
        if form.is_valid():
            # Lógica para el inicio de sesión exitoso
            return redirect('home')
    else:
        form = AuthenticationForm() # type: ignore

    return render(request, 'login.html', {'form': form})
#esta parte es la logica para que guarde datos en la bd de django
from django.shortcuts import render, redirect
from .forms import TicketForm

def creaciondeticket(request):
    if request.method == 'POST':
        form = TicketForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')  # Redirige a la página de inicio o donde desees después de guardar el ticket
    else:
        form = TicketForm()
    return render(request, 'core/creaciondeticket.html', {'form': form})


from .models import Ticket

def alltickets(request):
    tickets = Ticket.objects.all()
    return render(request, 'core/alltickets.html', {'tickets': tickets})

# logica para cerrar el Ticket-------------------------------------------------------------------------------------------------------

from django.shortcuts import get_object_or_404, redirect
from .models import Ticket

def cerrar_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, pk=ticket_id)
    ticket.closed = True
    ticket.save()
    return redirect('home')

def all_closed_tickets(request):
    closed_tickets = Ticket.objects.filter(closed=True)
    return render(request, 'ticketscerrados.html', {'closed_tickets': closed_tickets})

#logica de la vista para procesar los correos
from django.shortcuts import render, redirect
from .logicadecorreo import obtener_correos
import threading

def configurar_correo(request):
    if request.method == 'POST':
        # Obtener los datos del formulario
        pop_server = request.POST.get('pop_server')
        port = int(request.POST.get('port'))
        username = request.POST.get('username')
        password = request.POST.get('password')

        # Crear un hilo para ejecutar la función de obtener correos
        correo_thread = threading.Thread(target=obtener_correos, args=(pop_server, port, username, password))
        correo_thread.start()

        # Redirigir al usuario a la página de inicio después de iniciar el hilo
        return redirect('products')

    # Renderizar el formulario HTML
    return render(request, 'configuracion_correo.html')

#termina la logica de recepcion de correos -------------------------------------------------------------------------------------------

#logica para server smtp

def configure_smtp(request):
    return render(request, 'core/configure_smtp.html')

def enviar_correo1(request):
    return render(request, 'core/enviar_correo1.html')

from django.shortcuts import render
from django.http import HttpResponse
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from .models import ConfiguracionCorreo


def enviar_correo(request):
    if request.method == 'POST':
        smtp_host = request.POST.get('email_host')
        smtp_port = int(request.POST.get('email_port'))
        smtp_user = request.POST.get('email_host_user')
        smtp_password = request.POST.get('email_host_password')
        destinatario = request.POST.get('destinatario')
        asunto = 'FixFast te da la Bienvenida'
        cuerpo = 'Servidor STMP configurado correctamente'

                # Guardar configuración de correo en la base de datos
        configuracion, created = ConfiguracionCorreo.objects.get_or_create(
            smtp_host=smtp_host,
            smtp_port=smtp_port,
            smtp_user=smtp_user,
            smtp_password=smtp_password
        )
        configuracion.smtp_password = smtp_password  # Actualizamos la contraseña
        configuracion.save()

        # Crear el mensaje
        mensaje = MIMEMultipart()
        mensaje['From'] = smtp_user
        mensaje['To'] = destinatario
        mensaje['Subject'] = asunto
        mensaje.attach(MIMEText(cuerpo, 'plain'))

        try:
            # Conectar al servidor SMTP
            with smtplib.SMTP(smtp_host, smtp_port) as servidor:
                servidor.starttls()  # Iniciar TLS para seguridad
                servidor.login(smtp_user, smtp_password)  # Iniciar sesión en el servidor
                servidor.sendmail(smtp_user, destinatario, mensaje.as_string())  # Enviar correo
            
            return HttpResponse("Correo enviado exitosamente.")
        except Exception as e:
            return HttpResponse(f"Error al enviar el correo: {e}")
            

    return render(request, 'enviar_correo.html')

#aqui termina la logica para el servidor smtp

#Notificaciones con smtp 
def notificaciones(request):
    return render(request, 'core/notificaciones.html')


#perfil de usuario
def perfildeusuario(request):
    return render(request, 'core/perfildeusuario.html')


