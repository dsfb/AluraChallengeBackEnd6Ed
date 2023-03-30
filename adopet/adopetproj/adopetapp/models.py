from django.db import models


class Tutor(models.Model):
    email = models.EmailField()
    name = models.CharField("Nome", max_length=384)
    password = models.CharField("Senha", max_length=50)
    created = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name + ", " + self.email
