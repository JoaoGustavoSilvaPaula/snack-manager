import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/common/prisma/prisma.service';

@Injectable()
export class CustomerService {
  constructor(private readonly prisma: PrismaService) {}

  create(createCustomerDto: Prisma.CustomerCreateInput) {
    return this.prisma.customer.create({
      data: createCustomerDto,
    });
  }

  findAll() {
    return this.prisma.customer.findMany();
  }

  findOne(id: number) {
    return this.prisma.customer.findUnique({
      where: {
        id: id,
      },
    });
  }

  update(id: number, updateCustomerDto: Prisma.CustomerUpdateInput) {
    return this.prisma.customer.update({
      data: updateCustomerDto,
      where: {
        id: id,
      },
    });
  }

  remove(id: number) {
    return this.prisma.customer.delete({
      where: {
        id: id,
      },
    });
  }
}
