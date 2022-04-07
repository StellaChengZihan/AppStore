from django.shortcuts import render, redirect
from django.db import connection

# Create your views here.
def index(request):
    """Shows the main page"""

    
    ## Delete listing
    if request.POST:
        if request.POST['action'] == 'delete':
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM Catalog WHERE ID_place = %s", [request.POST['ID_place']])


    ## Use raw query to get all objects
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Catalog ORDER BY ID_place")
        listings = cursor.fetchall()

    result_dict = {'records': listings}

    return render(request,'app/index.html',result_dict)

# Create your views here.
def view(request, id):
    """Shows the main page"""
    
    ## Use raw query to get a listing
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Catalog c, Account a WHERE c.ID_account = a.ID AND ID_place = %s", [id])
        listing = cursor.fetchone()
    result_dict = {'cust': listing}

    return render(request,'app/view.html',result_dict)

# Create your views here.
def add(request):
    """Shows the main page"""
    context = {}
    status = ''

    if request.POST:
        ## Check if id is already in the table
        with connection.cursor() as cursor:

            cursor.execute("SELECT * FROM Catalog WHERE ID_account = %s", [request.POST['ID_account']])
            listing = cursor.fetchone()
            ## No account with same id
            if listing == None:
                ##TODO: date validation
                cursor.execute("INSERT INTO Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) VALUES (%s, %s, NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                        , [request.POST['ID_account'], request.POST['title'],
                           request.POST['country'], request.POST['city'], request.POST['price_per_night'], 
                           request.POST['type'], request.POST['address'], request.POST['guests'], request.POST['bedrooms'], request.POST['kitchen'],
                              request.POST['parking'], request.POST['wifi'], request.POST['smoking_allowed'], request.POST['pets_allowed'], request.POST['air_conditioning'],
                              request.POST['TV'], request.POST['washing_machine']])
                return redirect('index')    
            else:
                status = 'Listing of account %s with address %s already exists' % (request.POST['ID_account'], request.POST['address'])


    context['status'] = status
 
    return render(request, "app/add.html", context)

# Create your views here.
def edit(request, id):
    """Shows the main page"""

    # dictionary for initial data with
    # field names as keys
    context ={}

    # fetch the object related to passed id
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Catalog WHERE ID_place = %s", [id])
        obj = cursor.fetchone()

    status = ''
    # save the data from the form

    if request.POST:
        ##TODO: date validation
        with connection.cursor() as cursor:
            cursor.execute("UPDATE Catalog SET title = %s, country = %s, \
                         city = %s, price_per_night = %s, type = %s, address = %s, guests = %s, bedrooms = %s , kitchen = %s, parking = %s, wifi = %s \
                          , smoking_allowed = %s, pets_allowed = %s, air_conditioning = %s, TV = %s, washing_machine = %s WHERE ID_place = %s"
                    , [request.POST['title'], request.POST['country'], request.POST['city'], request.POST['price_per_night'], 
                        request.POST['type'], request.POST['address'], request.POST['guests'], request.POST['bedrooms'], request.POST['kitchen'], request.POST['parking']
                       , request.POST['wifi'], request.POST['smoking_allowed'], request.POST['pets_allowed'], request.POST['air_conditioning'], request.POST['TV'], request.POST['washing_machine'], id ])
            status = 'Listing edited successfully!'
            cursor.execute("SELECT * FROM Catalog WHERE ID_place = %s", [id])
            obj = cursor.fetchone()


    context["obj"] = obj
    context["status"] = status
 
    return render(request, "app/edit.html", context)
